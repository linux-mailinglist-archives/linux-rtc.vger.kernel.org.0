Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 404D970AC8
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Jul 2019 22:36:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729444AbfGVUgb (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 22 Jul 2019 16:36:31 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:49408 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728712AbfGVUgb (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 22 Jul 2019 16:36:31 -0400
Received: from relay10.mail.gandi.net (unknown [217.70.178.230])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 090163A7CA2;
        Mon, 22 Jul 2019 20:16:52 +0000 (UTC)
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 6372B240006;
        Mon, 22 Jul 2019 20:16:52 +0000 (UTC)
Date:   Mon, 22 Jul 2019 22:16:52 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Anson.Huang@nxp.com
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Linux-imx@nxp.com
Subject: Re: [PATCH] rtc: mxc_v2: use devm_platform_ioremap_resource() to
 simplify code
Message-ID: <20190722201652.GA24911@piout.net>
References: <20190717081217.30518-1-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190717081217.30518-1-Anson.Huang@nxp.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 17/07/2019 16:12:17+0800, Anson.Huang@nxp.com wrote:
> From: Anson Huang <Anson.Huang@nxp.com>
> 
> Use the new helper devm_platform_ioremap_resource() which wraps the
> platform_get_resource() and devm_ioremap_resource() together, to
> simplify the code.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  drivers/rtc/rtc-mxc_v2.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
