Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D03A84A2C
	for <lists+linux-rtc@lfdr.de>; Wed,  7 Aug 2019 12:55:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727185AbfHGKzG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 7 Aug 2019 06:55:06 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:35495 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726734AbfHGKzG (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 7 Aug 2019 06:55:06 -0400
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 7C5B320003;
        Wed,  7 Aug 2019 10:55:03 +0000 (UTC)
Date:   Wed, 7 Aug 2019 12:55:02 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Chen-Yu Tsai <wens@csie.org>, Mark Rutland <mark.rutland@arm.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        devicetree <devicetree@vger.kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-rtc@vger.kernel.org
Subject: Re: [linux-sunxi] [PATCH 0/3] Add basic support for RTC on Allwinner
 H6 SoC
Message-ID: <20190807105502.GK3600@piout.net>
References: <20190412120730.473-1-megous@megous.com>
 <CAGb2v66cbpsoHJoiFJkBwhZ5SbO+uO+Kf6gtnA3kPFQZq0329Q@mail.gmail.com>
 <20190806183045.edhm3qzpegscf2z7@core.my.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190806183045.edhm3qzpegscf2z7@core.my.home>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 06/08/2019 20:30:45+0200, Ondřej Jirman wrote:
> Maybe whether XO or DCXO is used also matters if you want to do some fine
> tunning of DCXO (control register has pletny of options), but that's probably
> better done in u-boot. And there's still no need to read HOSC source from DT.
> The driver can just check compatible, and if it is H6 and OSC_CLK_SRC_SEL is 1,
> it can do it's DCXO tunning, or whatever. But neither OS nor bootloader will
> be using this info to gate/disable the osciallator.
> 

It is actually useful to be able to tweak the crystal tuning at
runtime to be able to reduce clock drift and compare with a reliable
source (e.g. NTP).
I'm curious, what kind of options does this RTC have?

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
