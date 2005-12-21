(* Ocsigen
 * Copyright (C) 2005 Vincent Balat
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 *)


open XHTML.M
open Ocsigen

let menu ?(classe=[]) l current current_url =
  let rec aux = function
      [] -> []
    | [(url,text)] -> 
	let classe = ["last"] in
	if url == current 
	then [li ~a:[a_class ("current"::classe)] text]
	else [li ~a:[a_class classe] [a url current_url text]]
    | (url,text)::l -> 
	(if url == current 
	then  (li ~a:[a_class ["current"]] text)
	else (li [a url current_url text]))::(aux l)
  in match l with
    [] -> << <!-- empty menu --> >>
  | [(url,text)] ->
      ul ~a:[a_class ("menu"::classe)] 
	(let liclasse = ["first";"last"] in
	if url == current 
	then (li ~a:[a_class ("current"::liclasse)] text) 
	else (li ~a:[a_class liclasse] [a url current_url text])) []
  | (url,text)::l -> 
      ul ~a:[a_class ("menu"::classe)]
	(let liclasse = ["first"] in
	if url == current 
	then (li ~a:[a_class ("current"::liclasse)] text)
	else (li ~a:[a_class liclasse] [a url current_url text])) (aux l)