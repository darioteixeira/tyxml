(* TyXML
 * http://www.ocsigen.org/tyxml
 * Copyright (C) 2011 Pierre Chambart, Grégoire Henry
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, with linking exception;
 * either version 2.1 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Suite 500, Boston, MA 02111-1307, USA.
 *)

(** Typesafe constructors and printers for HTML5 documents.

    @see <http://www.w3.org/TR/html5/> W3C Recommendation *)

(** Type signature of HTML5 typesafe constructors  *)
module type T = HTML5_sigs.HTML5(XML.M)(SVG.M).T

(** Concrete implementation of HTML5 typesafe constructors *)
module M : T

(** Simple printer for HTML5 documents *)
module P : XML_sigs.TypedSimplePrinter(XML.M)(M).T

(** Parametrized stream printer for HTML5 documents *)
module MakePrinter(O : XML_sigs.Output) : XML_sigs.TypedPrinter(XML.M)(M)(O).T