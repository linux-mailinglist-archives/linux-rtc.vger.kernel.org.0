Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F2B0129418
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Dec 2019 11:18:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbfLWKSj (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 23 Dec 2019 05:18:39 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:52965 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbfLWKSj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 23 Dec 2019 05:18:39 -0500
X-Originating-IP: 176.184.22.51
Received: from localhost (did75-h03-176-184-22-51.dsl.sta.abo.bbox.fr [176.184.22.51])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 08E24E0008;
        Mon, 23 Dec 2019 10:18:36 +0000 (UTC)
Date:   Mon, 23 Dec 2019 11:18:36 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>
Subject: Re: [PATCH v2 1/2] rtc: hym8563: Return -EINVAL if the time is known
 to be invalid
Message-ID: <20191223101836.GC1054858@piout.net>
References: <20191212153111.966923-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191212153111.966923-1-paul.kocialkowski@bootlin.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 12/12/2019 16:31:10+0100, Paul Kocialkowski wrote:
> The current code returns -EPERM when the voltage loss bit is set.
> Since the bit indicates that the time value is not valid, return
> -EINVAL instead, which is the appropriate error code for this
> situation.
> 
> Fixes: dcaf03849352 ("rtc: add hym8563 rtc-driver")
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
> Changes since v1:
> - Addded Fixes tag.
> 
>  drivers/rtc/rtc-hym8563.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
