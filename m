Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FB07185803
	for <lists+linux-rtc@lfdr.de>; Sun, 15 Mar 2020 02:53:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727530AbgCOBw7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 14 Mar 2020 21:52:59 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:41290 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727524AbgCOBw7 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 14 Mar 2020 21:52:59 -0400
X-Greylist: delayed 857 seconds by postgrey-1.27 at vger.kernel.org; Sat, 14 Mar 2020 21:52:58 EDT
Received: from relay11.mail.gandi.net (unknown [217.70.178.231])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 31E9D3A8B7F;
        Sat, 14 Mar 2020 14:45:26 +0000 (UTC)
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id B4AE610000F;
        Sat, 14 Mar 2020 14:45:02 +0000 (UTC)
Date:   Sat, 14 Mar 2020 15:45:02 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Linux-imx@nxp.com
Subject: Re: [PATCH] rtc: snvs: Use devm_add_action_or_reset() for calls to
 clk_disable_unprepare()
Message-ID: <20200314144502.GD4518@piout.net>
References: <1584109849-21402-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1584109849-21402-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 13/03/2020 22:30:49+0800, Anson Huang wrote:
> Use devm_add_action_or_reset() for calls to clk_disable_unprepare(),
> which can simplify the error handling.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  drivers/rtc/rtc-snvs.c | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
