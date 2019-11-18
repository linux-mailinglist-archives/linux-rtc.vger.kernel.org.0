Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CA6F100733
	for <lists+linux-rtc@lfdr.de>; Mon, 18 Nov 2019 15:19:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726739AbfKROTM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 18 Nov 2019 09:19:12 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:56183 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726631AbfKROTM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 18 Nov 2019 09:19:12 -0500
X-Originating-IP: 92.184.107.65
Received: from localhost (unknown [92.184.107.65])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 41404E0007;
        Mon, 18 Nov 2019 14:19:10 +0000 (UTC)
Date:   Mon, 18 Nov 2019 15:19:09 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Kars de Jong <jongk@linux-m68k.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] rtc: msm6242: Remove unneeded
 msm6242_set()/msm6242_clear() functions
Message-ID: <20191118141909.GF3632@piout.net>
References: <20191116114620.9193-1-jongk@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191116114620.9193-1-jongk@linux-m68k.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 16/11/2019 12:46:20+0100, Kars de Jong wrote:
> The msm6242_set()/msm6242_clear() functions are used when writing to Control
> Register D to set or clear the HOLD bit when reading the current time from
> the RTC.
> 
> Doing this with a read-modify-write cycle will potentially clear an
> interrupt condition which occurs between the read and the write.
> 
> The datasheet states the following about this:
> 
>   When writing the HOLD or 30 second adjust bits of register D, it is
>   necessary to write the IRQ FLAG bit to a "1".
> 
> Since the only other bits in the register are the 30 second adjust bit
> (which is not used) and the BUSY bit (which is read-only), the
> read-modify-write cycle can be replaced by a simple write with the IRQ FLAG
> bit set to 1 and the other bits (except HOLD) set to 0.
> 
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Tested-by: Kars de Jong <jongk@linux-m68k.org>
> Signed-off-by: Kars de Jong <jongk@linux-m68k.org>
> ---
>  drivers/rtc/rtc-msm6242.c | 20 ++++----------------
>  1 file changed, 4 insertions(+), 16 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
