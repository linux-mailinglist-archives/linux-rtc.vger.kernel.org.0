Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48A6518EC75
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Mar 2020 22:11:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbgCVVLl (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 22 Mar 2020 17:11:41 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:65089 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726741AbgCVVLl (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 22 Mar 2020 17:11:41 -0400
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 78CFA40002;
        Sun, 22 Mar 2020 21:11:39 +0000 (UTC)
Date:   Sun, 22 Mar 2020 22:11:39 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Linux-imx@nxp.com
Subject: Re: [PATCH] rtc: mxc: Use devm_add_action_or_reset() for calls to
 clk_disable_unprepare()
Message-ID: <20200322211139.GC221863@piout.net>
References: <1584349785-27042-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1584349785-27042-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 16/03/2020 17:09:45+0800, Anson Huang wrote:
> Use devm_add_action_or_reset() for calls to clk_disable_unprepare(),
> which can simplify the error handling, and .remove callback can be dropped.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  drivers/rtc/rtc-mxc.c | 46 +++++++++++++++++++---------------------------
>  1 file changed, 19 insertions(+), 27 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
