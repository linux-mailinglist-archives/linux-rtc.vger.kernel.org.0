Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D5EE12941C
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Dec 2019 11:19:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbfLWKTi (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 23 Dec 2019 05:19:38 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:59431 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbfLWKTi (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 23 Dec 2019 05:19:38 -0500
Received: from localhost (did75-h03-176-184-22-51.dsl.sta.abo.bbox.fr [176.184.22.51])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 6D131240007;
        Mon, 23 Dec 2019 10:19:35 +0000 (UTC)
Date:   Mon, 23 Dec 2019 11:19:35 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Cc:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Akshay Bhat <akshay.bhat@timesys.com>
Subject: Re: [PATCH] rtc: rx8010: Fix return code for rx8010_probe
Message-ID: <20191223101935.GE1054858@piout.net>
References: <20191217121231.2698817-1-iwamatsu@nigauri.org>
 <20191217121231.2698817-2-iwamatsu@nigauri.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191217121231.2698817-2-iwamatsu@nigauri.org>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 17/12/2019 21:12:31+0900, Nobuhiro Iwamatsu wrote:
> In the current code, the return value of devm_request_threaded_irq may be
> returned. This fixes it.
> 
> CC: Alessandro Zummo <a.zummo@towertech.it>
> CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
> CC: Akshay Bhat <akshay.bhat@timesys.com>
> Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
> ---
>  drivers/rtc/rtc-rx8010.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
