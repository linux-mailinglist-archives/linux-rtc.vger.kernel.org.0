Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5954F8B6
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Apr 2019 14:22:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbfD3MW5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 30 Apr 2019 08:22:57 -0400
Received: from guitar.tcltek.co.il ([192.115.133.116]:58384 "EHLO
        mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726073AbfD3MW4 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 30 Apr 2019 08:22:56 -0400
Received: from tarshish (unknown [10.0.8.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx.tkos.co.il (Postfix) with ESMTPS id F3A4444028D;
        Tue, 30 Apr 2019 15:22:54 +0300 (IDT)
References: <20190430093212.28425-1-alexandre.belloni@bootlin.com> <20190430093212.28425-4-alexandre.belloni@bootlin.com>
User-agent: mu4e 1.0; emacs 26.1
From:   Baruch Siach <baruch@tkos.co.il>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/4] rtc: digicolor: convert to SPDX identifier
In-reply-to: <20190430093212.28425-4-alexandre.belloni@bootlin.com>
Date:   Tue, 30 Apr 2019 15:22:54 +0300
Message-ID: <8736lzu1gh.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Alexandre,

On Tue, Apr 30 2019, Alexandre Belloni wrote:
> Use SPDX-License-Identifier instead of a verbose license text.
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Acked-by: Baruch Siach <baruch@tkos.co.il>

baruch

> ---
>  drivers/rtc/rtc-digicolor.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/rtc/rtc-digicolor.c b/drivers/rtc/rtc-digicolor.c
> index ed2fc1adafd5..0aecc3f8e721 100644
> --- a/drivers/rtc/rtc-digicolor.c
> +++ b/drivers/rtc/rtc-digicolor.c
> @@ -1,14 +1,10 @@
> +// SPDX-License-Identifier: GPL-2.0+
>  /*
>   * Real Time Clock driver for Conexant Digicolor
>   *
>   * Copyright (C) 2015 Paradox Innovation Ltd.
>   *
>   * Author: Baruch Siach <baruch@tkos.co.il>
> - *
> - * This program is free software; you can redistribute it and/or modify it
> - * under the terms of the GNU General Public License as published by the
> - * Free Software Foundation; either version 2 of the License, or (at your
> - * option) any later version.
>   */
>  
>  #include <linux/io.h>


-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
