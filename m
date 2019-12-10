Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C0E6118CF8
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Dec 2019 16:50:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727178AbfLJPuL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 10 Dec 2019 10:50:11 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:45669 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727177AbfLJPuL (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 10 Dec 2019 10:50:11 -0500
X-Originating-IP: 90.182.112.136
Received: from localhost (136.112.broadband15.iol.cz [90.182.112.136])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id A4E671BF217;
        Tue, 10 Dec 2019 15:50:08 +0000 (UTC)
Date:   Tue, 10 Dec 2019 16:50:05 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Cc:     a.zummo@towertech.it, git@xilinx.com, linux-rtc@vger.kernel.org,
        michal.simek@xilinx.com, champagne.guillaume.c@gmail.com,
        maxime.roussinbelanger@gmail.com
Subject: Re: [PATCH 1/2] rtc: zynqmp: re-use rtc_time64_to_tm operation
Message-ID: <20191210155005.GR1463890@piout.net>
References: <20191128015613.10003-1-jeff.dagenais@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191128015613.10003-1-jeff.dagenais@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 27/11/2019 20:56:12-0500, Jean-Francois Dagenais wrote:
> This allows a subsequent commit to spin_unlock sooner.
> 
> Signed-off-by: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
> ---
>  drivers/rtc/rtc-zynqmp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
