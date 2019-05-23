Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82CCD28175
	for <lists+linux-rtc@lfdr.de>; Thu, 23 May 2019 17:42:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730918AbfEWPmr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 23 May 2019 11:42:47 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:55309 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730913AbfEWPmr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 23 May 2019 11:42:47 -0400
X-Originating-IP: 90.66.53.80
Received: from localhost (lfbn-1-3034-80.w90-66.abo.wanadoo.fr [90.66.53.80])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 6ECBFC0008;
        Thu, 23 May 2019 15:42:44 +0000 (UTC)
Date:   Thu, 23 May 2019 17:42:44 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Nicholas Mc Guire <hofrat@osadl.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: ds2404: use hw endiannes variable
Message-ID: <20190523154244.GU3274@piout.net>
References: <1557368035-6787-1-git-send-email-hofrat@osadl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1557368035-6787-1-git-send-email-hofrat@osadl.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 09/05/2019 04:13:55+0200, Nicholas Mc Guire wrote:
> Converting from hardware to host endiannes was done using reassignment
> to the same variable which makes sparse unhappy as it can not verify
> the endiannes handling properly. To allow sparse to verify endiannes
> handling an explicit __le32 is introduced. Note that this patch does
> not change the generated binary (x86_64 and ppc64 binary diff).
> 
> Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
> ---
> 
> Problem located by an experimental coccinelle script to locate
> patters that make sparse unhappy (false positives):
> 
> on little-endian x86_64 sparse complains about:
> drivers/rtc/rtc-ds2404.c:187:16: warning: cast to restricted __le32
> on big-endian ppc64 sparse complains about
> drivers/rtc/rtc-ds2404.c:187:16: warning: cast to restricted __le32
> drivers/rtc/rtc-ds2404.c:187:16: warning: cast to restricted __le32
> drivers/rtc/rtc-ds2404.c:187:16: warning: cast to restricted __le32
> drivers/rtc/rtc-ds2404.c:187:16: warning: cast to restricted __le32
> drivers/rtc/rtc-ds2404.c:187:16: warning: cast to restricted __le32
> drivers/rtc/rtc-ds2404.c:187:16: warning: cast to restricted __le32
> 
> Patch was compiletested with:
>  x86_64_defconfig + RTC_DRV_DS2404=m
>  ppc64_defconfig + RTC_DRV_DS2404=m
> 
> in both cases applying the patch has no impact on the generated binary.
> 
> Patch is against 5.1 (localversion-next is next-20190508)
> 
>  drivers/rtc/rtc-ds2404.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
