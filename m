Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51B3F1E8D27
	for <lists+linux-rtc@lfdr.de>; Sat, 30 May 2020 04:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728297AbgE3CQN (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 29 May 2020 22:16:13 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:49101 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727876AbgE3CQN (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 29 May 2020 22:16:13 -0400
X-Originating-IP: 86.202.110.81
Received: from localhost (lfbn-lyo-1-15-81.w86-202.abo.wanadoo.fr [86.202.110.81])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 02D8B40005;
        Sat, 30 May 2020 02:16:11 +0000 (UTC)
Date:   Sat, 30 May 2020 04:16:11 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     "Kevin P. Fleming" <kevin+linux@km6g.us>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: abx80x: Add Device Tree matching table
Message-ID: <20200530021611.GA316755@piout.net>
References: <20200528114617.166587-1-kevin+linux@km6g.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200528114617.166587-1-kevin+linux@km6g.us>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 28/05/2020 07:46:17-0400, Kevin P. Fleming wrote:
> Enable automatic loading of the module when a Device Tree overlay
> specifies a device supported by this driver.
> 
> Signed-off-by: Kevin P. Fleming <kevin+linux@km6g.us>
> ---
>  drivers/rtc/rtc-abx80x.c | 49 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
