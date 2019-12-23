Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FAEF129423
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Dec 2019 11:23:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726744AbfLWKXQ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 23 Dec 2019 05:23:16 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:56217 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726679AbfLWKXQ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 23 Dec 2019 05:23:16 -0500
Received: from localhost (did75-h03-176-184-22-51.dsl.sta.abo.bbox.fr [176.184.22.51])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 3391424000E;
        Mon, 23 Dec 2019 10:23:14 +0000 (UTC)
Date:   Mon, 23 Dec 2019 11:23:13 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Cc:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Raghavendra Chandra Ganiga <ravi23ganiga@gmail.com>,
        Ankur Srivastava <sankurece@gmail.com>
Subject: Re: [PATCH] rtc: ds1343: Remove unused struct spi_device in struct
 ds1343_priv
Message-ID: <20191223102313.GG1054858@piout.net>
References: <20191218081917.3308211-1-iwamatsu@nigauri.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191218081917.3308211-1-iwamatsu@nigauri.org>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 18/12/2019 17:19:17+0900, Nobuhiro Iwamatsu wrote:
> struct spi_device in struct ds1343_priv is not used, remove it.
> 
> CC: Alessandro Zummo <a.zummo@towertech.it>
> CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
> CC: Raghavendra Chandra Ganiga <ravi23ganiga@gmail.com>
> CC: Ankur Srivastava <sankurece@gmail.com>
> Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
> ---
>  drivers/rtc/rtc-ds1343.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
