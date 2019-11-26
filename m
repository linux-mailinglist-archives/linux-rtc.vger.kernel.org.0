Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BA6710A697
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Nov 2019 23:35:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726294AbfKZWfF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 26 Nov 2019 17:35:05 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:48123 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726103AbfKZWfE (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 26 Nov 2019 17:35:04 -0500
X-Originating-IP: 90.65.92.102
Received: from localhost (lfbn-1-1723-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 884691BF20A;
        Tue, 26 Nov 2019 22:35:02 +0000 (UTC)
Date:   Tue, 26 Nov 2019 23:35:02 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Cc:     linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: sun6i: Remove struct device from sun6i_rtc_dev
Message-ID: <20191126223502.GY299836@piout.net>
References: <20191123090538.32364-1-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191123090538.32364-1-nobuhiro1.iwamatsu@toshiba.co.jp>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 23/11/2019 18:05:38+0900, Nobuhiro Iwamatsu wrote:
> From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
> 
> struct device in struct sun6i_rtc_dev is not used, remove it.
> 
> Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
> ---
>  drivers/rtc/rtc-sun6i.c | 2 --
>  1 file changed, 2 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
