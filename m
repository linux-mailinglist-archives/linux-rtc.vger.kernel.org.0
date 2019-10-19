Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B61A9DDB1A
	for <lists+linux-rtc@lfdr.de>; Sat, 19 Oct 2019 23:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbfJSVOi (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 19 Oct 2019 17:14:38 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:52797 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726129AbfJSVOi (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 19 Oct 2019 17:14:38 -0400
Received: from localhost (lfbn-lyo-1-146-42.w86-202.abo.wanadoo.fr [86.202.229.42])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 42419240002;
        Sat, 19 Oct 2019 21:14:36 +0000 (UTC)
Date:   Sat, 19 Oct 2019 23:14:35 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Parthiban Nallathambi <pn@denx.de>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, parthitce@gmail.com
Subject: Re: [PATCH v2] rtc: rv3028: add clkout support
Message-ID: <20191019211435.GN3125@piout.net>
References: <20191018100425.1687979-1-pn@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018100425.1687979-1-pn@denx.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 18/10/2019 12:04:25+0200, Parthiban Nallathambi wrote:
> rv3028 provides clkout (enabled by default). Add clkout
> to clock framework source and control from device tree for
> variable frequency with enable and disable functionality.
> 
> Signed-off-by: Parthiban Nallathambi <pn@denx.de>
> ---
> 
> Notes:
>     Notes:
>     Changlog in v2:
>     	- Removed disabling the clock. clk core will disable it
>     	when no consumer is detected
>     	- Remove multiple write to CLKF
> 
>  drivers/rtc/rtc-rv3028.c | 146 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 146 insertions(+)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
