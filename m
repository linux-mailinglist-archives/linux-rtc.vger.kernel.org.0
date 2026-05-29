Return-Path: <linux-rtc+bounces-6590-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLzqJzwHGmrK0ggAu9opvQ
	(envelope-from <linux-rtc+bounces-6590-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 29 May 2026 23:38:04 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FF6608F52
	for <lists+linux-rtc@lfdr.de>; Fri, 29 May 2026 23:38:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 556EA302D96A
	for <lists+linux-rtc@lfdr.de>; Fri, 29 May 2026 21:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13CBC3A63F2;
	Fri, 29 May 2026 21:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZuXh3riY"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89A8375AD0
	for <linux-rtc@vger.kernel.org>; Fri, 29 May 2026 21:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780090560; cv=pass; b=TZ7wRcYT09GWNwpsMSbKDJFJUGU4KsfSFPK5Jk+ZmBjGqcndT15U/a0OhOIo/RoEaeKHtMq0Y4anK/QX+Mk8GESn1W00VOCdLrhIsUxArbvEBGKMlwnaQmLysELJN9Rs5FJXAijwKnMrPBsFRHKx1Ad81JzyfnLl2Z6mWFub574=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780090560; c=relaxed/simple;
	bh=/p+Nhsf4ZHcEuShSG9PqsTYgsO2Q5b1iHPWMwcUaRfg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lH1jbjf+YVMiA57O++GAsW3iyXhHQotssrSXss2hhUP8YoxSa97Qva/A+fym+rePlp/5tRh66RuTvci77+qVKTDJOx4LSaOV2qprIXVl/rZppoOjbi8bTffaq/+gOFbK/OVWIPlCFs5pSkpfIFvB7h3lsPfxZquBOWInPAy4Q5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZuXh3riY; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ee1a56328so2547668f8f.3
        for <linux-rtc@vger.kernel.org>; Fri, 29 May 2026 14:35:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780090557; cv=none;
        d=google.com; s=arc-20240605;
        b=UMfjydZjxfOP7xSNxkj0KPTe0xZkNoMTYZyAHGESAzMQCcG0Ch2RDj8pgyWHh5CDEv
         EFugj2a8TNlHQkt3UGN+T6aM1vORYqgLuoZ1iNNcWGtIq6uenWtxbBsr/HLSn6GCLKN8
         53Repw80/O+Moft6ipf74a50rSW6tcHn1Qia7D/gxyTypyNl0lxY7SOuyHoTkCbusheg
         I5gtAYg053lQkyeraFX/4jUtymi0hSpy+DTyh/DJbgUjVBVc5QIPxWUG1MtJFPtfgmOg
         AezqMEBGUKveYcT2h5HAEi3xig3gZWK5BimMd250m8tHCMixZN9+N+XO6IB44wOujaic
         afDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KdTTkoXA1F/pQA1Bi5kR0R37zi8RrCHvoR+ZJclo8dg=;
        fh=5A/ah8gnPB5ox7hYPPD4GWgdm5L5ylEqY9q0DEM5Pno=;
        b=U3OYL0Jp9N4s5QfyXkSyOaSFuIH1/wNOfubZoqwlQ2vi/AmTYKiFeaBA1blUaGAe7Z
         nsmrqx4ooZ6PNa8Ey81pgiTRcRascamXQKqts0pTJvsyT5TFLAdjvZ4XFDXjFudovPtT
         TwbhksXvsSZWUIMFYzFZuNdAMRJWrZ8F6dcLtq016zsRXJtC+ST/zzEN69a3uNDo0amJ
         aU3HvFkN/tJB8AxGxgWjMLgul+/DiSaw5XZEK/Ot5SJlqyy2Vddg7tG++CPUfPTyCzWV
         3ESwz8+2/otf3fqXFjlyM1GXZrNAqVCm1yKuvXqiHuOjMMkPzjZx+jkyiTtzTW850Czj
         Nk6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780090557; x=1780695357; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KdTTkoXA1F/pQA1Bi5kR0R37zi8RrCHvoR+ZJclo8dg=;
        b=ZuXh3riYuRKmiglLiZybwLTG6wDzeqjQxb672Iacf4hLGeVfzrTQ/DHcvBTbIHV0YY
         Lcl7VpavH8c6gYO2uvjpsOvMHPKDB1AYRIr1ozEJtSX6Ql479ggd1yWtmgVfvJP56xvf
         nupcf0MqH6dDYuaHD7+25LEQgE/b1/yO9K6W0gKTW9viSsN+KmDvHB+PoTvkZyLx1Xbj
         x+pbVAd7yYjH/uYDPttcX5LGHp4BFDuF/HdJpH2dvXapUdYAoCv2nJK3iRqOQgB6SXEJ
         wr/tQeNTsVNEq2Os5ahKJydjEy3Q0DO5CQfOdiORKEqaYWow+02gBylbaazE6UFPxrcQ
         2E4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780090557; x=1780695357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KdTTkoXA1F/pQA1Bi5kR0R37zi8RrCHvoR+ZJclo8dg=;
        b=gmte9dCfELJ9L3+oNGnOT5fvzWpBEr/SdZajPwYjFnFGkO2yZnsNMGasBU5+CEL+Oj
         R+D7geiQwfFh9lNm9Cv1x2cHksdhZ73j7FWS+C/IYDXYHfw1yvJbHJnNMvZEhnEuZrN2
         V9yq8ovAvDsybjOY2yW+4HVJR4cFXQ2iS/hJJ2n8cwpWVvdqqeXHOe1HyerHEb20tSwb
         2mrPHH0bJvaKBCr/VTMIXtMmSSJHuiLJoim2uWC0Q14BPmA0vw+20Kjj1HebtTDIr0q6
         6Cmj941h00+p0+tYwh594GAVtTBtAHHuw5ByQyqTJAxxVIvgAWQ+9gV8T9/pSwKSEXHt
         70Hg==
X-Gm-Message-State: AOJu0Yx7DwLnHJho/jnsg6Mks7oLBHaA5O8s3SuuEEvzTRxUhUDez5kG
	9J2USDSmzcRfF/Hlzq+0MT+o3lRrantByr52M4M1KbjKxZ0zJPAk0JFsc95mFabbdi9REVknfqG
	XLXFLXxsZ6o5HbnKVIsbUE5wcfE2h69w=
X-Gm-Gg: Acq92OF10eSUgKFnwXnEM5VQ5s7N9w39e8LOh5lQK+sdGPzhfJuE/RKATTpzFDsR9UA
	9MJiRvX4ROMoJo6yjZd4g/7kdplcdZ9kdPmDP3LxdDDC5dzmnDTELmRENWv11faw96EdeKEpkjk
	GkIG89Jvzrl2ttkpzW5+h3aQYpnzJxUIqsd4Cjx3E/VnDDaXKwntHfOcaLizp4Ze5844/kxL/Sg
	CBH4Q1/zkfyLO+eiOfwncqzHOq34pYmmDMDBEKCswLxW7xPwziRxrfXc+zY+wKy8I6pUvn5p95A
	DWGfrEjVEKVECmpfa2SIMif6CmqrKQYWjcZAu0h6AiNvOdmekwsaQcLP6ewpORtbQqmjRyq4N/+
	db2Sa3ABCUtAnmks=
X-Received: by 2002:a05:6000:1285:b0:45e:7997:8b7a with SMTP id
 ffacd0b85a97d-45ef6b159bbmr2183611f8f.16.1780090556805; Fri, 29 May 2026
 14:35:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506164914.3987293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260506164914.3987293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 29 May 2026 22:35:30 +0100
X-Gm-Features: AVHnY4J1HrehAlQEavxBOnGVjqVE1ymhht1RenFbTtp33jQ3RWkemXVxLG2IC5Y
Message-ID: <CA+V-a8vVZPaNYkzfncT_GfUyc0UtiSj+JpRnLt0u99z3oAvMaQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] rtc: renesas-rtca3: Various fixes and improvements
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6590-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D2FF6608F52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Wed, May 6, 2026 at 5:49=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Hi all,
>
> This patch series includes various fixes and improvements for the
> Renesas RTCA-3 RTC driver, including:
> - Fixing the polling condition when clearing the PIE bit during alarm
>   setup error handling.
> - Checking the result of the RADJ polling during initial setup and
>   propagating errors.
> - Correcting an error message related to reset control.
> - Fixing a typo in the documentation for the rtca3_ppb_per_cycle struct.
> - Refactoring year decoding logic into a helper function for better
>   readability.
>
> Cheers,
> Prabhakar
>
> Lad Prabhakar (5):
>   rtc: renesas-rtca3: Fix PIE clear polling condition in alarm setup
>     error path
>   rtc: renesas-rtca3: Check RADJ poll result during initial setup
>   rtc: renesas-rtca3: Fix incorrect error message for reset assert
>   rtc: renesas-rtca3: Fix typo in rtca3_ppb_per_cycle documentation
>   rtc: renesas-rtca3: Factor out year decoding helper
>
>  drivers/rtc/rtc-renesas-rtca3.c | 26 +++++++++++++++-----------
>  1 file changed, 15 insertions(+), 11 deletions(-)
>
Gentle ping.

Cheers,
Prabhakar

