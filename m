Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6330E18EC30
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Mar 2020 21:40:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbgCVUkU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 22 Mar 2020 16:40:20 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:50549 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726664AbgCVUkT (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 22 Mar 2020 16:40:19 -0400
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id EB994FF804;
        Sun, 22 Mar 2020 20:40:17 +0000 (UTC)
Date:   Sun, 22 Mar 2020 21:40:16 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] rtc: ds1307: handle oscillator failure flags for
 ds1388 variant
Message-ID: <20200322204016.GA221863@piout.net>
References: <20200207031812.14424-1-chris.packham@alliedtelesis.co.nz>
 <20200207031812.14424-2-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200207031812.14424-2-chris.packham@alliedtelesis.co.nz>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 07/02/2020 16:18:11+1300, Chris Packham wrote:
> The FLAG register is at a different location to the other supported RTCs
> so this requires an extra case in the existing switch statement.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>  drivers/rtc/rtc-ds1307.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
