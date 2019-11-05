Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E2B1F0403
	for <lists+linux-rtc@lfdr.de>; Tue,  5 Nov 2019 18:19:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390534AbfKERTz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 5 Nov 2019 12:19:55 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:43131 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390497AbfKERTz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 5 Nov 2019 12:19:55 -0500
Received: from localhost (alyon-657-1-975-54.w92-137.abo.wanadoo.fr [92.137.17.54])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id CA19D10000D;
        Tue,  5 Nov 2019 17:19:53 +0000 (UTC)
Date:   Tue, 5 Nov 2019 18:19:53 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Ilya Ledvich <ilya@compulab.co.il>
Cc:     Nobuhiro Iwamatsu <iwamatsu@nigauri.org>, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2] rtc: em3027: correct month value
Message-ID: <20191105171953.GF8309@piout.net>
References: <20191031102717.GB2967@piout.net>
 <20191101095422.14787-1-ilya@compulab.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191101095422.14787-1-ilya@compulab.co.il>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 01/11/2019 11:54:22+0200, Ilya Ledvich wrote:
> The RTC month value is 1-indexed, but the kernel assumes it is 0-indexed.
> This may result in the RTC not rolling over correctly.
> 
> Signed-off-by: Ilya Ledvich <ilya@compulab.co.il>
> ---
>  drivers/rtc/rtc-em3027.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
