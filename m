Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB3FD19ECA9
	for <lists+linux-rtc@lfdr.de>; Sun,  5 Apr 2020 18:38:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726918AbgDEQiC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 5 Apr 2020 12:38:02 -0400
Received: from mleia.com ([178.79.152.223]:50104 "EHLO mail.mleia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726667AbgDEQiC (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sun, 5 Apr 2020 12:38:02 -0400
X-Greylist: delayed 393 seconds by postgrey-1.27 at vger.kernel.org; Sun, 05 Apr 2020 12:38:01 EDT
Received: from mail.mleia.com (localhost [127.0.0.1])
        by mail.mleia.com (Postfix) with ESMTP id E02923D6201;
        Sun,  5 Apr 2020 16:31:27 +0000 (UTC)
Subject: Re: [PATCH] rtc: Delete an error message in three functions
To:     Markus Elfring <Markus.Elfring@web.de>, linux-rtc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Tang Bin <tangbin@cmss.chinamobile.com>
References: <04116352-b464-041c-1939-96440133aa6f@web.de>
From:   Vladimir Zapolskiy <vz@mleia.com>
Message-ID: <a33be664-7b21-a9a5-de45-7bb24740e927@mleia.com>
Date:   Sun, 5 Apr 2020 19:31:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <04116352-b464-041c-1939-96440133aa6f@web.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20200405_163127_942536_44D09C9E 
X-CRM114-Status: GOOD (  12.73  )
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 4/5/20 6:36 PM, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 5 Apr 2020 17:30:15 +0200
> 
> The function “platform_get_irq” can log an error already.
> Thus omit redundant messages for the exception handling in the
> calling functions.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/rtc/rtc-fsl-ftm-alarm.c | 4 +---
>  drivers/rtc/rtc-lpc24xx.c       | 4 +---

For LPC24xx/18xx/43xx change

Acked-by: Vladimir Zapolskiy <vz@mleia.com>

>  drivers/rtc/rtc-mt2712.c        | 4 +---
>  3 files changed, 3 insertions(+), 9 deletions(-)
> 

--
Best wishes,
Vladimir
