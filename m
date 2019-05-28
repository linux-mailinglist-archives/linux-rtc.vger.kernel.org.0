Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 018752C655
	for <lists+linux-rtc@lfdr.de>; Tue, 28 May 2019 14:20:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbfE1MUc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 28 May 2019 08:20:32 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:45153 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726580AbfE1MUc (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 28 May 2019 08:20:32 -0400
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 6E6FA200017;
        Tue, 28 May 2019 12:20:26 +0000 (UTC)
Date:   Tue, 28 May 2019 14:20:25 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 01/10] dt-bindings: rtc: Move trivial RTC over to trivial
 devices
Message-ID: <20190528122025.vv4oyt5cwetj2hzp@flea>
References: <290402405a34506997fd2fab2c4c1486dbe6b7e5.1558958381.git-series.maxime.ripard@bootlin.com>
 <20190527120626.GM3274@piout.net>
 <20190527121832.lui2n6vhlemlqy2z@flea>
 <20190527160657.GN3274@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190527160657.GN3274@piout.net>
User-Agent: NeoMutt/20180716
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On Mon, May 27, 2019 at 06:06:57PM +0200, Alexandre Belloni wrote:
> On 27/05/2019 14:18:32+0200, Maxime Ripard wrote:
> > Hi Alex,
> >
> > On Mon, May 27, 2019 at 02:06:26PM +0200, Alexandre Belloni wrote:
> > > On 27/05/2019 14:00:33+0200, Maxime Ripard wrote:
> > > > The RTC generic bindings has a bunch of devices that have a pretty simple
> > > > binding, with just compatible, reg and optional interrupts properties.
> > > >
> > >
> > > This is not true, they all also support the star-year property, this is
> > > why they are not in the trivial-devices file anymore.
> >
> > Ok, I misunderstood the binding then.
> >
> > Should we create a separate file for the trivial RTC, on the model of
> > the trivial-devices but supporting all the RTC properties?
>
> I would say that this is the way forward. Note that all the RTCs
> support start-year but you will have to check for the other
> properties.

The way this will work is that it's a two layers thing. Patch 2
creates a generic RTC binding schema that will match on two things:
  - Schemas including it directly,
  - any devicetree node following the node name pattern.

The point of that schema is to validate that every node (or binding),
if it has those properties, the schemas will make sure that it's the
proper type, (and if we would have any) ranges, etc.

Then, it's up for the driver schemas to do a more on-point validation,
with whatever constraints they have. They can choose to restrict the
set of properties, or not to, it's really up to the device schema.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
