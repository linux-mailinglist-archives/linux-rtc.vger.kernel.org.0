Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68D57129426
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Dec 2019 11:24:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726733AbfLWKYg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 23 Dec 2019 05:24:36 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:50201 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726679AbfLWKYg (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 23 Dec 2019 05:24:36 -0500
X-Originating-IP: 176.184.22.51
Received: from localhost (did75-h03-176-184-22-51.dsl.sta.abo.bbox.fr [176.184.22.51])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id EFCC520008;
        Mon, 23 Dec 2019 10:24:32 +0000 (UTC)
Date:   Mon, 23 Dec 2019 11:24:31 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Cc:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Jonas Jensen <jonas.jensen@gmail.com>
Subject: Re: [PATCH] rtc: moxart: Convert to SPDX identifier
Message-ID: <20191223102431.GI1054858@piout.net>
References: <20191218082836.3309808-1-iwamatsu@nigauri.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191218082836.3309808-1-iwamatsu@nigauri.org>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 18/12/2019 17:28:36+0900, Nobuhiro Iwamatsu wrote:
> Use SPDX-License-Identifier instead of a verbose license text.
> 
> CC: Alessandro Zummo <a.zummo@towertech.it>
> CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
> CC: Jonas Jensen <jonas.jensen@gmail.com>
> Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
> ---
>  drivers/rtc/rtc-moxart.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
