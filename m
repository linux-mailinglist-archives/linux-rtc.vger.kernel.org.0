Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2835C118CDA
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Dec 2019 16:45:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727332AbfLJPpC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 10 Dec 2019 10:45:02 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:47295 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727330AbfLJPpC (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 10 Dec 2019 10:45:02 -0500
Received: from localhost (136.112.broadband15.iol.cz [90.182.112.136])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 7565810000F;
        Tue, 10 Dec 2019 15:44:59 +0000 (UTC)
Date:   Tue, 10 Dec 2019 16:44:56 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Josef Friedl <josef.friedl@speed.at>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] rtc: mt6397: drop free_irq of devm_ allocated irq
Message-ID: <20191210154456.GQ1463890@piout.net>
References: <20191113021720.9527-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191113021720.9527-1-weiyongjun1@huawei.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 13/11/2019 02:17:20+0000, Wei Yongjun wrote:
> The devm_request_threaded_irq function allocates irq that is
> released when a driver detaches. Thus, there is no reason to
> explicitly call free_irq in probe function.
> 
> Fixes: 851b87148aa2 ("rtc: mt6397: improvements of rtc driver")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/rtc/rtc-mt6397.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
