Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4FBB100731
	for <lists+linux-rtc@lfdr.de>; Mon, 18 Nov 2019 15:18:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726668AbfKROS6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 18 Nov 2019 09:18:58 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:54575 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726631AbfKROS5 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 18 Nov 2019 09:18:57 -0500
Received: from localhost (unknown [92.184.107.65])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 7C6E1200003;
        Mon, 18 Nov 2019 14:18:55 +0000 (UTC)
Date:   Mon, 18 Nov 2019 15:18:54 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Kars de Jong <jongk@linux-m68k.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] rtc: msm6242: Fix reading of 10-hour digit
Message-ID: <20191118141854.GE3632@piout.net>
References: <20191116110548.8562-1-jongk@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191116110548.8562-1-jongk@linux-m68k.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 16/11/2019 12:05:48+0100, Kars de Jong wrote:
> The driver was reading the wrong register as the 10-hour digit due to
> a misplaced ')'. It was in fact reading the 1-second digit register due
> to this bug.
> 
> Also remove the use of a magic number for the hour mask and use the define
> for it which was already present.
> 
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Tested-by: Kars de Jong <jongk@linux-m68k.org>
> Signed-off-by: Kars de Jong <jongk@linux-m68k.org>
> ---
>  drivers/rtc/rtc-msm6242.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
