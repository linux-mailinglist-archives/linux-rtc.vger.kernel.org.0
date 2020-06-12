Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8E881F7BA2
	for <lists+linux-rtc@lfdr.de>; Fri, 12 Jun 2020 18:31:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbgFLQb3 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 12 Jun 2020 12:31:29 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:60213 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726319AbgFLQb2 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 12 Jun 2020 12:31:28 -0400
X-Originating-IP: 86.202.110.81
Received: from localhost (lfbn-lyo-1-15-81.w86-202.abo.wanadoo.fr [86.202.110.81])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 90C37C0005;
        Fri, 12 Jun 2020 16:31:26 +0000 (UTC)
Date:   Fri, 12 Jun 2020 18:31:26 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     "Kevin P. Fleming" <kevin+linux@km6g.us>
Cc:     devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/2] rtc: abx80x: Add support for autocalibration filter
 capacitor
Message-ID: <20200612163126.GC4232@piout.net>
References: <20200530124900.363399-1-kevin+linux@km6g.us>
 <20200530124900.363399-2-kevin+linux@km6g.us>
 <20200610152204.GX3720@piout.net>
 <CAE+UdoqR1iPaYxT4aMCNkq0z8duy6abJcuojDz=wKCe7ZMtD5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE+UdoqR1iPaYxT4aMCNkq0z8duy6abJcuojDz=wKCe7ZMtD5Q@mail.gmail.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 12/06/2020 07:55:53-0400, Kevin P. Fleming wrote:
> On Wed, Jun 10, 2020 at 11:22 AM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> > I'd like to avoid having more error messages in the driver (and whole
> > subsystem). Can you move the ABX8XX_REG_CFG_KEY setting earlier in
> > abx80x_probe so you don't have to do it here and avoid duplication the
> > error message?
> >
> 
> Based on my reading of the app manual this won't work properly, as
> setting the configuration key only allows writing to one register, and
> then the key is reset. It has to be set to allow enabling the trickle
> charger, and also to allow enabling the autocalibration filter
> capacitor.
> 

That is correct and I forgot about that. Can you move just setting the
key to a function as a preliminary patch?

> > The RTC can still work if this fails and the rror is transient, maybe
> > just warn and continue. It will be set on the next probe.
> 
> Will fix in the next version of the patch.
> 
> Thanks for the review!

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
