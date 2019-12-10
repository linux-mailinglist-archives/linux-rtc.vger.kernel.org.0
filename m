Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 997351189D0
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Dec 2019 14:29:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbfLJN3l (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 10 Dec 2019 08:29:41 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:38197 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727061AbfLJN3l (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 10 Dec 2019 08:29:41 -0500
X-Originating-IP: 90.182.112.136
Received: from localhost (136.112.broadband15.iol.cz [90.182.112.136])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 9839CFF804;
        Tue, 10 Dec 2019 13:29:39 +0000 (UTC)
Date:   Tue, 10 Dec 2019 14:29:36 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Chuhong Yuan <hslester96@gmail.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-rtc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: stm32: add missed clk_disable_unprepare in error
 path of resume
Message-ID: <20191210132936.GL1463890@piout.net>
References: <20191205160655.32188-1-hslester96@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191205160655.32188-1-hslester96@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 06/12/2019 00:06:55+0800, Chuhong Yuan wrote:
> The resume() forgets to call clk_disable_unprepare() when failed.
> Add the missed call to fix it.
> 
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> ---
>  drivers/rtc/rtc-stm32.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
