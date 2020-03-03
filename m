Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29E7E177B95
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Mar 2020 17:09:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729382AbgCCQJP (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 3 Mar 2020 11:09:15 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:41283 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729208AbgCCQJP (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 3 Mar 2020 11:09:15 -0500
X-Originating-IP: 86.202.111.97
Received: from localhost (lfbn-lyo-1-16-97.w86-202.abo.wanadoo.fr [86.202.111.97])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 3686BC0021;
        Tue,  3 Mar 2020 16:09:13 +0000 (UTC)
Date:   Tue, 3 Mar 2020 17:09:12 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     guosongsu@gmail.com
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, suguosong <suguosong@xiaomi.com>
Subject: Re: [PATCH] RTC: use kobj_to_dev
Message-ID: <20200303160912.GD58186@piout.net>
References: <20200225021923.8570-1-guosongsu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200225021923.8570-1-guosongsu@gmail.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 25/02/2020 10:19:23+0800, guosongsu@gmail.com wrote:
> From: suguosong <suguosong@xiaomi.com>
> 
> use kobj_to_dev instead of open-conding it
> 
> Signed-off-by: suguosong <suguosong@xiaomi.com>
> ---
>  drivers/rtc/sysfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
