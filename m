Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBEB515A7CC
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Feb 2020 12:24:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727511AbgBLLXp (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 12 Feb 2020 06:23:45 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:35059 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727279AbgBLLXp (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 12 Feb 2020 06:23:45 -0500
X-Originating-IP: 90.65.102.129
Received: from localhost (lfbn-lyo-1-1670-129.w90-65.abo.wanadoo.fr [90.65.102.129])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 094DFC000A;
        Wed, 12 Feb 2020 11:23:42 +0000 (UTC)
Date:   Wed, 12 Feb 2020 12:23:42 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>
Cc:     a.zummo@towertech.it, michal.simek@xilinx.com, sgoud@xilinx.com,
        shubhraj@xilinx.com, linux-rtc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        git@xilinx.com
Subject: Re: [PATCH v2] rtc: zynqmp: Clear alarm interrupt status before
 interrupt enable
Message-ID: <20200212112342.GC3326@piout.net>
References: <1581503079-387-1-git-send-email-srinivas.neeli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1581503079-387-1-git-send-email-srinivas.neeli@xilinx.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 12/02/2020 15:54:39+0530, Srinivas Neeli wrote:
> Fix multiple occurring interrupts for alarm interrupt. RTC module doesn't
> clear the alarm interrupt status bit immediately after the interrupt is
> triggered.This is due to the sticky nature of the alarm interrupt status
> register. The alarm interrupt status register can be cleared only after
> the second counter outruns the set alarm value. To fix multiple spurious
> interrupts, disable alarm interrupt in the handler and clear the status
> bit before enabling the alarm interrupt.
> 
> Fixes: 11143c19eb57 ("rtc: add xilinx zynqmp rtc driver")
> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
> ---
> Changes in V2:
> Addressed Michal Simek comments
>  - Removed new line in declartion part.
>  - Added new line before return.
> ---
>  drivers/rtc/rtc-zynqmp.c | 27 +++++++++++++++++++++++----
>  1 file changed, 23 insertions(+), 4 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
