Return-Path: <linux-rtc+bounces-6284-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJ4dAKVVzmnPmwYAu9opvQ
	(envelope-from <linux-rtc+bounces-6284-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Apr 2026 13:40:21 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B41E388719
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Apr 2026 13:40:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 47BAA308F493
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Apr 2026 11:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFCAC3CCA1E;
	Thu,  2 Apr 2026 11:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I9mzrwKV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7183A3D8120
	for <linux-rtc@vger.kernel.org>; Thu,  2 Apr 2026 11:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775129488; cv=pass; b=WVzYiSqUGipRcBFBg51OcO88BJgYz0dGsasFFqkbhoKu0OfMaV2zRCrPuAzbxc8goNN2d0+pU+1bIpvm4WqNwaZgrhyZjRo/B2S+vnLajvtZPTH+TaRR8eZj7YRVtEg5JYm/vU/+NZiJtfeRN1I2ij8uv7pK62unU3mOLetRCcE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775129488; c=relaxed/simple;
	bh=YMzP0datrfnXrNyBIyBZ4SLQypxT0D3DUHKlJiwFpvY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LW+pSzfJ7EvwWHAtGutKLTJpTuoM3msxF5fG9fshk2zg6gleTDha7FcKL/1bDKp6hVHifs2JwGB1EIMdPaIGoIv5NtEgg3eqFZuWYt2XQzjSHXFokilhgD/L/CwkHfA79OctB/ox6da97VxtegMW35R5t2HjybilxhiKlOccwEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I9mzrwKV; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12a71ade78cso995562c88.0
        for <linux-rtc@vger.kernel.org>; Thu, 02 Apr 2026 04:31:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775129476; cv=none;
        d=google.com; s=arc-20240605;
        b=FsvqJCP8PkzzhKT9dO60/IwPyasLWJS/0cl3QoeN41pAbpKxVvrJonDRWmli09g/79
         LtLC+srdxk4kGqnVWOLNRP/JCQx13lqwcIxgJHdVQhmrOSDDv9ZYiQcbJrtgjWxyITNN
         5bBn8ebLW2iRzTu0xCqouti7gCNG+TcQ/180F1g7tHOfUZ7LGK3ZwwRUktd3jUWNE0EQ
         Kyf6+s9hrzhUzRuk41hKiEuI46xDBos6Gs2Zptesn1ngqXArI3efo8Eh5cuG2ydHzyNw
         R9rNWF9EfibvtyY2QyvA6mU59/rC+w8JwyK15AN6/5YZHQNm6oxkFJCxOpvw7HLhnWJy
         +fzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rC+GzInJ4RFVl9AiUw43QCU88NmO9P93zEbx9fCnVZI=;
        fh=IacQpBElSG16nJHRt9IFIBB6Z9BZ8QA810rCQ8kGc70=;
        b=JGIapZ6pXRGy/XRjmJah5XBQk72Kj6abp6p5X81/QAusi8NCuuC+Cf7YrnhZxR06x5
         M3QB6o1pT4mDYb3PdAaGgVD0L2axqi/vrKzkGNWSCJWPH0zkbaWVatF73gi1OYqkGvgF
         CuDk/ICxabntVUFWv3C+HCzgC/eFwVU1ODZXq3IJBECcMkwPQr20BEyhcGAuLtJDJ0tL
         ZFokE9XGHrkZA0UDY8mPGv1JMDZGRSi59Yw1A8d9ye3NGiLAkREwNI8nKntMu3Mnm9Iv
         ajOv7HuafHsHbiZD+WhOzr39+sI3XBoR2lEVyD5lowCAq3vbrWHBmcCFxxn3JheXDLmW
         QVgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775129476; x=1775734276; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rC+GzInJ4RFVl9AiUw43QCU88NmO9P93zEbx9fCnVZI=;
        b=I9mzrwKVHM/UK9XNvtORaEkH4T8w7rnh5FaMWRNdn1seqEu579JOI9n0sSbOVhjo2W
         +ivs5dklLLK0QZeAtdI6OaFkbnycVNcQdLFgyvaO5MGggBVcSj7tAQq+ks34IL0Qy0qc
         Ct1/RSXnUoXaW8rIdoJ6HJVNELt3VJSqIUppwtLzARMyE1/DypIVJL7FpjrFw/Sl+ISW
         +RSOl7TkYtmKxb0Es3jHc9O8KFJ77+3hPaL3l15uojinztRoxkEwzGuxes8VNWTl2eF6
         WxGMGQqVEPIiha8X6fBTTMEkiTqwJTquub1LPFu3QeGkKUz1MUHdbJGWkPso4xCHkdar
         y88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775129476; x=1775734276;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rC+GzInJ4RFVl9AiUw43QCU88NmO9P93zEbx9fCnVZI=;
        b=WL28PWVaxslvGRxR6iNxftwu0WNnWchWNilXSS/Fb18RCT+Yu3s+Lvy41TBXu+lAV0
         ZOu7JwQ51IM+EQRHKAErWiH26vAuo8k9YC81NfRFwo03gQsZykpTG8eORdxPGp8pQZg0
         KTPhwsucpa4gTmkHhKrSdwncOQ8VWYS3DHY17+9e+64yTf0TQfsyZjLJaVqev0jAac+Q
         cb8od/zCIrrfdOj45mZZSZDfK5hkfvJEWugzTFHN+iH05E2DMMMbqht2Mt+8LO0mftVz
         Kwxs27uKxZlHuzUZKDW6aKG04NMYC4nWMA+jCjFe8QDoPRNXsF4bArHh9LQ7RUHQTaxw
         /9iw==
X-Gm-Message-State: AOJu0Yyjbq8C5Vl6U/+2TpUJj7wLPHyJQlMhqk/RMJwNgo39N/PPq7N+
	A0YY+WSmRwPh5lRHtKobxXAmWhl9v8gqiM3mdmH4tWv2KYktLWj/RvkNqYnBVe+JZlb9e7No/qs
	GP3j0zAIjAbwUpei9k6hM0LzwICS93EUOJKcMkEU=
X-Gm-Gg: ATEYQzwFwmnYGb4kFWvwvwuqcsjjtpBt0YCmb/G3Dyyu+54AVMj6Peom0NziRIxPGnm
	gZbfyMdSVyUB9L7WbOyVAeSWNq4ZSm+gDZKjml8eFM+kzQ12XkrQnwo1lnG40A4fCInpUpMZphl
	rpihbczb94b/oVjuxqSknEHbOL7iFwGSOjnTPAZOMrjE3pSB8XOayq16/3kyJxC5JEgyiZRkLLP
	Cu1xJbTG6vhic4X7DOLxxWcC/4VYB2rjIrE7Zee4WNrYqQV1kGNcnl6nvoz9dlJiwH5KoDDv6jO
	gL9stObD3xoCL0Mtt/Q=
X-Received: by 2002:a05:7022:2508:b0:12a:7181:2eff with SMTP id
 a92af1059eb24-12be645defbmr3780671c88.4.1775129475926; Thu, 02 Apr 2026
 04:31:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401165245.936428-1-eagle.alexander923@gmail.com> <20260401165245.936428-3-eagle.alexander923@gmail.com>
In-Reply-To: <20260401165245.936428-3-eagle.alexander923@gmail.com>
From: Alexander Shiyan <eagle.alexander923@gmail.com>
Date: Thu, 2 Apr 2026 14:31:04 +0300
X-Gm-Features: AQROBzDBqaphWiw5hQWNLDNAfdYnGgxwOdNtGTfwR8xSlWzg3vI1jeaulSpfwtI
Message-ID: <CAP1tNvTxppwEyVvG0TXoHNYtvSMwG7pGoJfoiHuWUerQFW6NEA@mail.gmail.com>
Subject: Re: [PATCH 3/6] rtc: m41t80: Fix watchdog resolution bit handling for
 chips without extra resolution
To: linux-rtc@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, "Steven A . Falco" <sfalco@harris.com>, 
	Atsushi Nemoto <anemo@mba.ocn.ne.jp>, Alessandro Zummo <a.zummo@towertech.it>, 
	Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6284-lists,linux-rtc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eaglealexander923@gmail.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 6B41E388719
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello.

Unfortunately, I have reviewed this patch and come to the conclusion
that it is incorrect.
Please skip its review (3/6).

> For chips without the extra watchdog resolution (i.e., those with only 2
> resolution bits), bit 7 (RB2) must be cleared to avoid invalid settings.
> The current logic clears RB2 only when extra resolution is present.
> Reverse the condition.
>
> Fixes: d3a126fcf9df ("rtc: rtc-m41t80.c: add support for the ST M41T65 RTC")
> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> ---
>  drivers/rtc/rtc-m41t80.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
> index 52f398107d35..11ef8195e786 100644
> --- a/drivers/rtc/rtc-m41t80.c
> +++ b/drivers/rtc/rtc-m41t80.c
> @@ -658,10 +658,10 @@ static void wdt_ping(void)
>                 i2c_data[1] = wdt_margin << 2 | 0x82;
>
>         /*
> -        * M41T65 has three bits for watchdog resolution.  Don't set bit 7, as
> -        * that would be an invalid resolution.
> +        * Chips with extra watchdog resolution have three bits.
> +        * Don't set bit 7, as that would be an invalid resolution.
>          */
> -       if (clientdata->features & M41T80_FEATURE_WDR)
> +       if (!(clientdata->features & M41T80_FEATURE_WDR))
>                 i2c_data[1] &= ~M41T80_WATCHDOG_RB2;
>
>         i2c_transfer(save_client->adapter, msgs1, 1);
> --
> 2.52.0
>

