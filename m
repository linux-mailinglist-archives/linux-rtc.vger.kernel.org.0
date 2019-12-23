Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D075129425
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Dec 2019 11:24:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726733AbfLWKYV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 23 Dec 2019 05:24:21 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:37523 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726679AbfLWKYV (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 23 Dec 2019 05:24:21 -0500
Received: from localhost (did75-h03-176-184-22-51.dsl.sta.abo.bbox.fr [176.184.22.51])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id DCD2A24000F;
        Mon, 23 Dec 2019 10:24:19 +0000 (UTC)
Date:   Mon, 23 Dec 2019 11:24:18 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Cc:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>
Subject: Re: [PATCH] rtc: pcf8563: Use BIT
Message-ID: <20191223102418.GH1054858@piout.net>
References: <20191218082553.3309554-1-iwamatsu@nigauri.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191218082553.3309554-1-iwamatsu@nigauri.org>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 18/12/2019 17:25:53+0900, Nobuhiro Iwamatsu wrote:
> Replace (1 << ...) with BIT().
> 
> CC: Alessandro Zummo <a.zummo@towertech.it>
> CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
> ---
>  drivers/rtc/rtc-pcf8563.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
