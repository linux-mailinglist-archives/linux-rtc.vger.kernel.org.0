Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E94B12941A
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Dec 2019 11:18:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbfLWKSx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 23 Dec 2019 05:18:53 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:38715 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbfLWKSx (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 23 Dec 2019 05:18:53 -0500
X-Originating-IP: 176.184.22.51
Received: from localhost (did75-h03-176-184-22-51.dsl.sta.abo.bbox.fr [176.184.22.51])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 5CE59E000D;
        Mon, 23 Dec 2019 10:18:51 +0000 (UTC)
Date:   Mon, 23 Dec 2019 11:18:49 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>
Subject: Re: [PATCH v2 2/2] rtc: hym8563: Read the valid flag directly
 instead of caching it
Message-ID: <20191223101849.GD1054858@piout.net>
References: <20191212153111.966923-1-paul.kocialkowski@bootlin.com>
 <20191212153111.966923-2-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191212153111.966923-2-paul.kocialkowski@bootlin.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 12/12/2019 16:31:11+0100, Paul Kocialkowski wrote:
> The RTC has a valid bit in the seconds register that indicates whether
> power was lost since the pevious time set. This bit is currently read
> once at probe time, cached and updated with set_time.
> 
> Howeever, caching the bit may prevent detecting power loss at runtime
> (which can happen if the RTC's supply is distinct from the the platform's).
> 
> Writing the seconds register when setting time will clear the bit,
> so there should be no downside in reading the bit directly instead of
> caching it.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
> Changes since v1:
> - Removed hym8563 unused variables;
> - Checked buf[0] for VL flag instead of ret;
> - Reorded patches.
> 
>  drivers/rtc/rtc-hym8563.c | 19 +++++++------------
>  1 file changed, 7 insertions(+), 12 deletions(-)
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
