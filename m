Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37E1A2B8AF
	for <lists+linux-rtc@lfdr.de>; Mon, 27 May 2019 18:07:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbfE0QHJ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 27 May 2019 12:07:09 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:45041 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725991AbfE0QHJ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 27 May 2019 12:07:09 -0400
X-Originating-IP: 90.66.53.80
Received: from localhost (lfbn-1-3034-80.w90-66.abo.wanadoo.fr [90.66.53.80])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 37872C0019;
        Mon, 27 May 2019 16:07:03 +0000 (UTC)
Date:   Mon, 27 May 2019 18:06:57 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 01/10] dt-bindings: rtc: Move trivial RTC over to trivial
 devices
Message-ID: <20190527160657.GN3274@piout.net>
References: <290402405a34506997fd2fab2c4c1486dbe6b7e5.1558958381.git-series.maxime.ripard@bootlin.com>
 <20190527120626.GM3274@piout.net>
 <20190527121832.lui2n6vhlemlqy2z@flea>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190527121832.lui2n6vhlemlqy2z@flea>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 27/05/2019 14:18:32+0200, Maxime Ripard wrote:
> Hi Alex,
> 
> On Mon, May 27, 2019 at 02:06:26PM +0200, Alexandre Belloni wrote:
> > On 27/05/2019 14:00:33+0200, Maxime Ripard wrote:
> > > The RTC generic bindings has a bunch of devices that have a pretty simple
> > > binding, with just compatible, reg and optional interrupts properties.
> > >
> >
> > This is not true, they all also support the star-year property, this is
> > why they are not in the trivial-devices file anymore.
> 
> Ok, I misunderstood the binding then.
> 
> Should we create a separate file for the trivial RTC, on the model of
> the trivial-devices but supporting all the RTC properties?
> 

I would say that this is the way forward. Note that all the RTCs support
start-year but you will have to check for the other properties.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
