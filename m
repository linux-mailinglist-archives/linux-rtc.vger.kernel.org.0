Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E01001CDD08
	for <lists+linux-rtc@lfdr.de>; Mon, 11 May 2020 16:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728544AbgEKOXr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 11 May 2020 10:23:47 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:47991 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727792AbgEKOXr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 11 May 2020 10:23:47 -0400
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 9C8A620006;
        Mon, 11 May 2020 14:23:44 +0000 (UTC)
Date:   Mon, 11 May 2020 16:23:44 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     wu000273@umn.edu
Cc:     a.zummo@towertech.it, Markus.Elfring@web.de,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kjlu@umn.edu
Subject: Re: [PATCH v2] rtc: mc13xxx: fix a double-unlock issue
Message-ID: <20200511142344.GR34497@piout.net>
References: <20200503182235.1652-1-wu000273@umn.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200503182235.1652-1-wu000273@umn.edu>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 03/05/2020 13:22:35-0500, wu000273@umn.edu wrote:
> From: Qiushi Wu <wu000273@umn.edu>
> 
> In function mc13xxx_rtc_probe, the mc13xxx_unlock() is called
> before rtc_register_device(). But in the error path of
> rtc_register_device(), the mc13xxx_unlock() is called again,
> which causes a double-unlock problem. Thus add a call of the
> function “mc13xxx_lock” in an if branch for the completion
> of the exception handling.
> 
> Fixes: e4ae7023e182a ("rtc: mc13xxx: set range")
> Signed-off-by: Qiushi Wu <wu000273@umn.edu>
> ---
>  drivers/rtc/rtc-mc13xxx.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
