Return-Path: <linux-rtc+bounces-6789-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BBxrDnv5Q2oZmgoAu9opvQ
	(envelope-from <linux-rtc+bounces-6789-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Jun 2026 19:14:35 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BF76E6CE4
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Jun 2026 19:14:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b="QrMl6L/f";
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6789-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6789-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 086C630E44B3
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Jun 2026 17:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C609C3DB632;
	Tue, 30 Jun 2026 17:10:47 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F843D9040
	for <linux-rtc@vger.kernel.org>; Tue, 30 Jun 2026 17:10:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782839447; cv=none; b=sYic+kZLpNUPWfM6wvVJsCVZpfb6MUNliDULoP/vZzYlpCu+hoB84RRSSW4jFCnndSQmhtg4NEE/kl4d4VIlDGuxUeYMg1NvagnIwm5ZrInDVyddfQWpgFrDBFYXuNfOti1z3I2FoLCdFnURhh5L64+CaH8nTCMDSmTy+Fz65Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782839447; c=relaxed/simple;
	bh=03ZPDA6oq0RjCOV5I+SfA2+tJkpm1lBTv7FIpC3RkzA=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=gf2mXpABdBYG+7tSbsi7vgUdzi4ISniVTHjxSt5ilj5OqgHzg+ejeXpEz5iaGD8mWSI0bKAQRIKrHX0iQQ0sxUewvgD/a157m/UVTMT48W044I7q5lZeZLz25PJlCUG41X5IOlt8A/tYDCPfla63Rz7tv9n4P7/qdTTmKg19BbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=QrMl6L/f; arc=none smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so5588965e9.1
        for <linux-rtc@vger.kernel.org>; Tue, 30 Jun 2026 10:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782839443; x=1783444243; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qDLnOcAd7ZZHF5x5O1HE3KJ4BVd4hKBS8yr3fbFM2JI=;
        b=QrMl6L/fWjSVV/Z/lHqHLXJsKvxnXQtmTkU/w/TtNyDwu99SeWBRxO7ztRub5btqA2
         gT2a4hk3GR3amfXOMVHV7tffe8t/6LPHgyPjROST2+zQABBKlB2Rwqa3xVQFAgQOcqOk
         m4V9FhCUdlYgeJnwyP43m4z5VVmmGnQL7QVO6Ppb9gD/OM6EqQpa0CLiZf92GRbZXchm
         0WslmRVaIB4AnvYGt4c7vc3CaO39f9vXwIJxWYPCMRQ3CjMaWoqGu4XFjlLlaO9Qd/A3
         Whjma16p3vqP6fPuWrA0AfrhYhMGWYqaFwDva2ngo7zlU2LXXca5GnHw9tB7bQeu77Ff
         YH2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782839443; x=1783444243;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qDLnOcAd7ZZHF5x5O1HE3KJ4BVd4hKBS8yr3fbFM2JI=;
        b=Xb+6e4mUK0HfEAPbohJmPxQzPQI0K6FgLZr0GdnFS9wAmWwJH864Zgs+beigZmylZ1
         g1nFzLwbyzBlx7nS2uKP15nejXi4xIa55C5Twb5b4jsRynD432QcZVoWXP4Hv7r5Nba1
         G+3iIOZDsyaA1W1b2UqYC9gkJ2jathNSrlGrCSWbMiuupG0jE0rm309ise7K79qRJzkT
         rvG4+bHFWgF22I9lh0O5DdqXx5L+e0JI8+IuSNy9/x/KZz3rh3Smg/LAFOCVMEBCb51+
         TxwxR9IG6P6+sX5U+7zKopHLPkuKgnDmJeZiWzRPCaWNKdcotuAVLrmDqifUKBcdSn5f
         xBgQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Rj4laUOk4whaixJyTxPe0reVFe3Axkk4nxmqEeiX5rjeEaVN+ez5BUFmSqHEgFozcTYFNmorHkFE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGxV980wxIpiK6nPCx0WqRpw1/FXKGh/vXSw0kl5lk6XVLWXsw
	gv4hiV+CqIIC9/76cflojWnr03CMX8s5vuCdoFjhNVjiPdWAQ2XBYnB8O4uQLHO+sb5jHaWr5cP
	n0exS4TE=
X-Gm-Gg: AfdE7cnBTjrvrr+/LUyC+Uh9Q99tcO/fbYSt6N51ExCtCrdsDk6XTiEVpNgz1MK56kc
	x+e7NlnlrLrdUIZgN0ESFuc5QAvgLjvun2krhZ56tLj+dG0h5EAR1N5h+eHiNCkkIgGMHN94Kz9
	DJ0t8MuILg4ApF33Ov3aTgs/ykguCxFgDZChE4R6szWme2rA3eDlDC0/tHBabtN0vU00W6sQarw
	gLl7wYT3tX5UomOgl4+8mci21/Wh1+IgDx/6bqlQYAIeBHFCYJOxVRxmcEC5ZOU190gjEzMQ+hh
	IHYAEOo3DnBerZ7kWzuWwyITqbVcriHhcoymbMaHoMWppE8rtuh/oBOtKPTBUC4LTD8ums+vHXh
	9PoAEonl940a9uil7gjUey/iMovt0Kfx0GO4v/WZ52IHtv6W+AvKlgoyuUZAEfHAw0R2Bi7dkvT
	u0zNQvv5axMxB9QMvSqMAeuYcgDqki4exKr/JlFg3d8k6HppO0WE3q
X-Received: by 2002:a05:600c:8715:b0:493:b36b:4933 with SMTP id 5b1f17b1804b1-493bc2099a9mr39383615e9.3.1782839443244;
        Tue, 30 Jun 2026 10:10:43 -0700 (PDT)
Received: from [192.168.7.218] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47563d195a7sm9017973f8f.7.2026.06.30.10.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 10:10:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/4] rtc: palmas: convert to dev_err_probe()
From: Alexandre Mergnat <amergnat@baylibre.com>
To: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
In-Reply-To: <20260528-cleanup-dev-err-probe-rtc-v1-1-29dc9cb6c3f0@microchip.com>
References: <20260528-cleanup-dev-err-probe-rtc-v1-0-29dc9cb6c3f0@microchip.com>
 <20260528-cleanup-dev-err-probe-rtc-v1-1-29dc9cb6c3f0@microchip.com>
Date: Tue, 30 Jun 2026 19:10:30 +0200
Message-Id: <178283943063.3929176.3030385070138696756.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1153; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=03ZPDA6oq0RjCOV5I+SfA2+tJkpm1lBTv7FIpC3RkzA=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqQ/iQS+GlZ/2suXKxEuJ0jFJdssdfMQ1BNgX87
 P5sEqnzpSuJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCakP4kAAKCRArRkmdfjHU
 RaeYEAC00MsmoWeGDOM4s8LqnkOkZx468tUvKylqxh784XN498UDf06mrA4aWiY+Tdp42UE1kuH
 8Wq3Kf4XcwWsHRZyhVbxb5mjntCiaBgBksfZs9m2BM7rOIlGlu8pPDkQjavlj3B2IUe90ne/mb1
 CsLOWyALXO0vDF+Pzpf7eZ0GpFwA3E27gaKqh9DVg7KYqrpxMHRlsaiS+t5FE4Wr04cj2BT70mi
 IYJhGkGymeocT+H+v/Oq8XVpxSHopgDmE1tWVydN377bZ2iKw70E0Ib3668CPBKWbn+3if5mjxl
 uU6k20VWkAxS2T+V1CzhMuc5HES8B/KlDpN99s/RDwFLjM5QqNXR9rp//hl/+7rqsfQoFdotb9P
 9rM4UoQ1FOJ52L61LlyOHWn9+iGs2020H9a7gnd/XQhUl6c51bV+e/Do8Zewg/ihU7tE6OJP1sL
 yoYBRx9T1b/bVXDrWwQ5arbzOuZXQmPh8JbFI2CQ9V1k3qlXd/SDqPCiszzefcNG6+JttSdC0RX
 OIauQvOnanMqRd3jMyXNtOUmgThJ+yXlzaVjgyvncJ+1tWSFH2GIY5173okvKpZ+xFaahO/OPuS
 g7fwM1QOYeSKXObD7nQVel86/tMeNdRT1P5UlV4tGgb3MtHMSBy0OxCdAzI/pRJYuFF10pvYIXg
 WDIx06OZ+6MyGNQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6789-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:balakrishnan.s@microchip.com,m:alexandre.belloni@bootlin.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:orsonzhai@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:zhanglyra@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[amergnat@baylibre.com,linux-rtc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bootlin.com,linux.alibaba.com,gmail.com,vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amergnat@baylibre.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,microchip.com:email,baylibre.com:dkim,baylibre.com:email,baylibre.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 87BF76E6CE4

On Thu, 28 May 2026 09:16:44 +0530, Balakrishnan Sambath <balakrishnan.s@microchip.com> wrote:
> diff --git a/drivers/rtc/rtc-palmas.c b/drivers/rtc/rtc-palmas.c
> index aecada6bcf8b..25fe7a8b73a0 100644
> --- a/drivers/rtc/rtc-palmas.c
> +++ b/drivers/rtc/rtc-palmas.c
> @@ -280,10 +278,8 @@ static int palmas_rtc_probe(struct platform_device *pdev)
>  	ret = palmas_update_bits(palmas, PALMAS_RTC_BASE, PALMAS_RTC_CTRL_REG,
>  			PALMAS_RTC_CTRL_REG_STOP_RTC,
>  			PALMAS_RTC_CTRL_REG_STOP_RTC);
> -	if (ret < 0) {
> -		dev_err(&pdev->dev, "RTC_CTRL write failed, err = %d\n", ret);
> -		return ret;
> -	}
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret, "RTC_CTRL write failed\n");

The enable_bb_charging block earlier in this function (the two
palmas_update_bits() / "BACKUP_BATTERY_CTRL update failed" error paths)
follows the same dev_err()+return ret pattern but is left unconverted.
Converting those too keeps the whole probe consistent.
It's purely about readability, not correctness, so I give my RB.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Alexandre Mergnat <amergnat@baylibre.com>

