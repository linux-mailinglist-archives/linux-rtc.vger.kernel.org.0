Return-Path: <linux-rtc+bounces-95-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CED7C9BA5
	for <lists+linux-rtc@lfdr.de>; Sun, 15 Oct 2023 22:57:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B54028161B
	for <lists+linux-rtc@lfdr.de>; Sun, 15 Oct 2023 20:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9335311CBD;
	Sun, 15 Oct 2023 20:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jcf+c4t0"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D07EA1
	for <linux-rtc@vger.kernel.org>; Sun, 15 Oct 2023 20:57:11 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6788AB;
	Sun, 15 Oct 2023 13:57:09 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DF66760003;
	Sun, 15 Oct 2023 20:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697403428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KposqxUkWAf3vRCPWp69IhSrFYyQGaqXqsPRR4m39pE=;
	b=jcf+c4t0m6YBHl6BWe1glmi5PpqUwCEULveJk2TN7x97QSF7O8Mo7xFJzNwEz4iKm49uWi
	njPjizkytfdGVy4I05nkUmICZ3tKe+41PfLQb5+f9nGLTxa3og9tzBWxw4NpD9lsjPksxB
	Ebp5ExSnEn+6SDdt8PFhs/sVf4QN9FUkcTEF42LQoOI45DDA2v/zaO6EI6kF9gcQPomHQw
	vqY3/rOUfVYicZZ0xx065ZL3+gL3zs0GM+A4YU2aAEDzfVZhn9qyYW1/TZ5Bttcdm/Bd3L
	1MjpuCO79ocxiyVvQhoYyPHtiTJayECXvtGh3qFou0OSrnF2/LSf8Ff3aNClHg==
Date: Sun, 15 Oct 2023 22:57:06 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Maxim Korotkov <korotkov.maxim.s@gmail.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH] rtc: efi: fixed typo in efi_procfs()
Message-ID: <20231015205706326de111@mail.local>
References: <20231006090444.306729-1-korotkov.maxim.s@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231006090444.306729-1-korotkov.maxim.s@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 06/10/2023 12:04:44+0300, Maxim Korotkov wrote:
> After the first check of the value of the "eft" variable
> it does not change, it is obvious that a copy-paste
> error was made here and the value of variable "alm"
> should be checked here.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: 101ca8d05913 ("rtc: efi: Enable SET/GET WAKEUP services as optional")
I had a look at the history and this is actually a bug that predates
v2.6.12-rc2 and so its introduction is not in the main git repo history.

I guess nobody actually cares and I'm very tempted to just rip out this
procfs file.


> Signed-off-by: Maxim Korotkov <korotkov.maxim.s@gmail.com>
> ---
>  drivers/rtc/rtc-efi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-efi.c b/drivers/rtc/rtc-efi.c
> index dc6b0f4a54e2..fa8bf82df948 100644
> --- a/drivers/rtc/rtc-efi.c
> +++ b/drivers/rtc/rtc-efi.c
> @@ -227,7 +227,7 @@ static int efi_procfs(struct device *dev, struct seq_file *seq)
>  			   enabled == 1 ? "yes" : "no",
>  			   pending == 1 ? "yes" : "no");
>  
> -		if (eft.timezone == EFI_UNSPECIFIED_TIMEZONE)
> +		if (alm.timezone == EFI_UNSPECIFIED_TIMEZONE)
>  			seq_puts(seq, "Timezone\t: unspecified\n");
>  		else
>  			/* XXX fixme: convert to string? */
> -- 
> 2.34.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

