Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2035222ABF
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Jul 2020 20:18:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728257AbgGPSST (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 16 Jul 2020 14:18:19 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:54965 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728182AbgGPSST (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 16 Jul 2020 14:18:19 -0400
X-Originating-IP: 90.65.108.121
Received: from localhost (lfbn-lyo-1-1676-121.w90-65.abo.wanadoo.fr [90.65.108.121])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id EBAA11BF20F;
        Thu, 16 Jul 2020 18:18:16 +0000 (UTC)
Date:   Thu, 16 Jul 2020 20:18:16 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Bruno Thomsen <bruno.thomsen@gmail.com>, linux-rtc@vger.kernel.org,
        linux-watchdog@vger.kernel.org, a.zummo@towertech.it,
        wim@linux-watchdog.org, linux@roeck-us.net, bth@kamstrup.com
Subject: Re: [PATCH v3 4/5] rtc: pcf2127: add watchdog feature support
Message-ID: <20200716181816.GF3428@piout.net>
References: <20190822131936.18772-1-bruno.thomsen@gmail.com>
 <20190822131936.18772-4-bruno.thomsen@gmail.com>
 <20200716144705.o57m4r7ptmsm3m6n@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200716144705.o57m4r7ptmsm3m6n@pengutronix.de>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 16/07/2020 16:47:05+0200, Uwe Kleine-König wrote:
> Hello,
> 
> On Thu, Aug 22, 2019 at 03:19:35PM +0200, Bruno Thomsen wrote:
> > Add partial support for the watchdog functionality of
> > both PCF2127 and PCF2129 chips.
> 
> I have a board here with a pcf2127 that has the #RST pin
> not connected.
> 
> The problem this creates is: The bootloader arms the SoC's watchdog and
> jumps into Linux. The pcf2127 driver happens to load first, so watchdog0
> is provided by the RTC (but non-functional). Systemd is configured to
> feed the watchdog, but happens to feed the wrong one, so the machine
> resets shortly after it is up :-|
> 
> So I wonder if we need a dt property that tells the driver if the RST
> line is connected or not.
> 

I guess the current solution is to set WatchdogDevice to point to a link
that is updated by udev thus ensuring it points to the correct watchdog
device regardless of the probe order.

This would be similar to the /dev/rtc symlink, pointing to the systohc
RTC by default (even if I don't really like that heuristic).

What you suggest is somewhat okay but doesn't really solve the issue if
both watchdogs are functional and systemd still doesn't pick the one
that is armed by the bootloader.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
