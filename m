Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B3D5D6688
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Oct 2019 17:51:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730002AbfJNPun (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 14 Oct 2019 11:50:43 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:37871 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730314AbfJNPum (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 14 Oct 2019 11:50:42 -0400
X-Originating-IP: 86.207.98.53
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 5370FE000B;
        Mon, 14 Oct 2019 15:50:39 +0000 (UTC)
Date:   Mon, 14 Oct 2019 17:50:38 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     linux-kernel@vger.kernel.org, monstr@monstr.eu, git@xilinx.com,
        Srinivas Goud <srinivas.goud@xilinx.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: xilinx: Fix calibval variable type
Message-ID: <20191014155038.GS3125@piout.net>
References: <20765c4c27aa92c75426b82fd2815ebef6471492.1570544738.git.michal.simek@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20765c4c27aa92c75426b82fd2815ebef6471492.1570544738.git.michal.simek@xilinx.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 08/10/2019 16:25:41+0200, Michal Simek wrote:
> From: Srinivas Goud <srinivas.goud@xilinx.com>
> 
> This patch fixes the warnings reported by static code analysis.
> Updated calibval variable type to unsigned type from signed.
> 
> Signed-off-by: Srinivas Goud <srinivas.goud@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> ---
> 
>  drivers/rtc/rtc-zynqmp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
