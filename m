Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C476B9A228
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2019 23:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732732AbfHVV10 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 22 Aug 2019 17:27:26 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:52707 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731003AbfHVV1Z (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 22 Aug 2019 17:27:25 -0400
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 255BF240004;
        Thu, 22 Aug 2019 21:27:23 +0000 (UTC)
Date:   Thu, 22 Aug 2019 23:27:22 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Bruno Thomsen <bruno.thomsen@gmail.com>
Cc:     linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        a.zummo@towertech.it, wim@linux-watchdog.org, linux@roeck-us.net,
        u.kleine-koenig@pengutronix.de, bth@kamstrup.com
Subject: Re: [PATCH v3 2/5] rtc: pcf2127: cleanup register and bit defines
Message-ID: <20190822212722.GH27031@piout.net>
References: <20190822131936.18772-1-bruno.thomsen@gmail.com>
 <20190822131936.18772-2-bruno.thomsen@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190822131936.18772-2-bruno.thomsen@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 22/08/2019 15:19:33+0200, Bruno Thomsen wrote:
> Cleanup of defines to follow kernel coding style and increase code
> readability by using same register and bit define style.
> 
> Change PCF2127_REG_RAM_{addr_MSB,wrt_cmd,rd_cmd} to upper case as
> kernel coding guide section 12 'Macros, Enums and RTL' states
> "Names of macros defining constants and labels in enums are capitalized".
> 
> Improve readability of RAM register comment by making whole sentences.
> 
> Remove parentheses from register defines as they are only used
> for expressions and not constants.
> 
> As there are no clear style for name of registers and bits in the
> kernel drivers, I suggest the following for at least this driver,
> but hopefully also other RTC drivers.
> 
> Register name should follow this convention:
> [chip]_REG_[reg name] 0xXX
> 
> Bit name should follow this convention, so it clearly states which
> chip register it's part of:
> [chip]_BIT_[reg name]_[bit name] BIT(X)
> 
> Additionally I suggest bit defines are always placed right below
> its corresponding register define and using an extra tab indentation
> for the BIT(X) part. This will visualt make it easy to see that bit
> defines are part of the complete register definition.
> 
> Rename PCF2127_OSF to PCF2127_BIT_SC_OSF and move it right below
> PCF2127_REG_SC. This will improve readability of bit checks as it's
> easy to verify that it uses the correct register.
> 
> Move end of line comments above register defines as it's more like
> a heading for 1 register define and up to 8 bit defines or a
> collection of registers that are close related like timestamp
> split across 6 registers.
> 
> Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
> ---
> v3: no change.
> v2: updated commit message.
> 
>  drivers/rtc/rtc-pcf2127.c | 59 ++++++++++++++++++++++-----------------
>  1 file changed, 33 insertions(+), 26 deletions(-)
> 
Applied, even if most of the churn is annoying. However, I agree
PCF2127_OSF should have been named differently.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
