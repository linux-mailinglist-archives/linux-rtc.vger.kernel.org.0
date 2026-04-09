Return-Path: <linux-rtc+bounces-6306-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKGrONhY12lqMwgAu9opvQ
	(envelope-from <linux-rtc+bounces-6306-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 09 Apr 2026 09:44:24 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE8E3C7307
	for <lists+linux-rtc@lfdr.de>; Thu, 09 Apr 2026 09:44:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AF9F83008630
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Apr 2026 07:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD0F337FF7A;
	Thu,  9 Apr 2026 07:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gIXs5aku"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A51837C906
	for <linux-rtc@vger.kernel.org>; Thu,  9 Apr 2026 07:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775720658; cv=pass; b=VuBZoJ2qHuYcUuGYZnqltJovTUN0N4WZpbjdzpL1tBvPm0HuPheVRmn3dYX6aDwFDYdxLLtLUi3hxsp2XAAJ+qELUgZReymDXwmBl7C8hRTmwca5gb043/1YJF6M8NeZn+F2ioppf5fHzD81aPd/1HEZuUsAG31gGkOBIeZU3uA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775720658; c=relaxed/simple;
	bh=unXet/iL5/aNElFYjzBuKW9iIKfPTLg2m6eG/z4if7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iL8/WcxbtPj0m9m3P2ZmbRTc9m7znjxDvfdgLUzxEJ77FKRr3OiHbrGCpK75w27Hw12FyZdB4gf3q2LyHeG5P9RV8Tdk7kCDhxd3OnvB6fyU+142KQ/0+ZfWRQAq5OraDozp1rKLcUo/gwhn+VhX02tLdP4tccCFhJMasWVsTU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gIXs5aku; arc=pass smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8d424af6282so57197885a.0
        for <linux-rtc@vger.kernel.org>; Thu, 09 Apr 2026 00:44:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775720656; cv=none;
        d=google.com; s=arc-20240605;
        b=bx9pnHzZtSuayP9AIKptkKJo+GO20bZ5ZXChd/RsfYBFNFvLhM2DA6n1Wqb2PRA4Li
         RV6VJULjGlHl/fXIfTuRGygonbGtmjPaB2yXiWPiKQ/K+zqmXrtqfFHE3C4ljCD0EBNj
         39piA1fVeOyLj8uSXe1+KJnQATmBHiDa2BQlAnRB7jQfofDB/pzUFSph4An774bs9x/z
         Nr0k5f7burP1nAWoUxiwPyyBBW2sYXfu5AVW+f1Mr6TrgeyaY7nbIRFQVugqwq78L93q
         1WEPkQDTr6bKV/7pQ4aMhnHncE0+fZrPhuwT8Uf/7ldlt3qgO/a53/LBmmFPUKn0iC0y
         IDBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mjKb6EN/rzrknJzk+ZEcHNzKcWRM5K86to8xhtDCCyE=;
        fh=C0k1QOKysu9ZkEr+QA6N09UcVyKkd1cA8Puo0W2J/M0=;
        b=hSyG86Pzgl7yI7nP2UFgj3b/dQaiXeSgvlJZH0S6HipyBvLkvdC45K1pGxx52mQTd6
         68mjakhuLYmiWegT4AHOAhxSAzZTSOwIKkb+WC2aV1am+BIv6eB5aWUsieLv4QwXhyEZ
         H5xrEZJZ4Or/Uag9vPkMqaervISVx+C5rl7Nk9JYv5NTZrLJMF2NbIKeQO+qLFWStTd/
         ucNQ5Kcu6t4rOP4O4vqpePY5M0dKASURrnExKC7YrfB99J306ydxhgA6TosArBYmwRZD
         8ks8cVd2UzKfS1lnO+E3c5tyoMzWS4zqGTnocLwdQcsNuGWGDn08YuzY6McJYL5CKUYH
         CTOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775720656; x=1776325456; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mjKb6EN/rzrknJzk+ZEcHNzKcWRM5K86to8xhtDCCyE=;
        b=gIXs5akurQP6oDT41+MkhC6fVFMI7zrGMibpLyVitNr/47sRQU/S7tYg6oQX37YOQR
         Yq1J04o48fN00/1nPyKI/omWp/dAjqjVmQSqUXbgJcM7XSORJWa636ybtxeE4gWnqwvQ
         Hd5QsZbvLP9z6dRLi1C+ClexzwTvHhmhkoyLDsvSFJhaKvpIEUg43YOkG3aZOZTTgpPO
         iwOWyUYZigRya9uN7lFGHBDpHYVKE329GCNeEyxLa7MKd2f0xMtcP2hBTwJNVK2Io1CN
         Gh80REQ5KCnzySSF0Fzd9k5eGSlHve9FxXdMMChJ1YNuNiwT8pPVIqr1R6zopmN44+nU
         SJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775720656; x=1776325456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mjKb6EN/rzrknJzk+ZEcHNzKcWRM5K86to8xhtDCCyE=;
        b=MQwqCo1Hdw1H05X7JIqIYgmmg4DxSlqkdVNXrIBghDBjsuIK1R3WxDUN0K8q+F4vM9
         RIPMnrqpaKkAYlwKLFRRDvQck+b8ztcLuEo03mc7bZWMJgw4jF4xOX50EBVQegHebAGN
         +X7Ol0+9HVCgsc9hYZcwbg+C6FrQk0N6Sfk2DCRi/uVKBGxj2Nd+miX2hPRaiIkSMkxl
         1f2zVNezas0JQNSjhe8jvEwMs0FD5ZQRw2IrHISl4FFHJRuXgfYrI70EzjtrMMqs0okj
         F6g9cslM9/qkAqW7KE2FtYegBvlphJgINx/orahcXpHJP3o6WD7rsDAPkvH4aIDfeC/9
         xk+A==
X-Forwarded-Encrypted: i=1; AJvYcCUw/3dw0vXT++BTuwK63zPgg9FF4jL7uqoE2UGxBvK6jOviUMR6dFjuZeq/oqpH7vOCKq7S87mgjcE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpZpbgOf4+iehgqLeaH989I45IRjTA3R5qpkkF3RYaYpOwWS9O
	bkVdK9MV6KH3rvRAr/zAjiUCLEy8cPQ61rF9FVsP5pfQrS1B8wYWc+odaHZEyP2JGSztswC93Y7
	n6Rh8b6JF3xLIq21YJBhcwcrUyCU+ZF6TqSYpQ6A=
X-Gm-Gg: AeBDieuwh/KY4R0WzNwxGVWRf3klAUBToBMpRdSe5iRTKWcV5BQNRPKyVSSIONi015+
	ZwzD4cCqHe18ORMX5NXA+JXPNAIsBtC1+o2uKeVOq49tZhJUcI6QczntEjwsqTvZjiDLOZBKPvq
	7GU2DAhq4SOV88Awg+MboJq4hUA7GvyPm8i8ltPmO8LCXVLsC7UqOjGXm3JvPyJjyfdC93UGMzQ
	kEjrolQrjOAWfVJjVDf0dH27rQKOmLtC7CMv1xbwxck+BMUJWvxSrH1dI1Etlo3Yw4Dtn7YWVMP
	+x2pRmPwmBNxKvOyYbg=
X-Received: by 2002:a05:620a:448e:b0:8d5:26e2:661f with SMTP id
 af79cd13be357-8dc3d65d215mr363217385a.42.1775720655867; Thu, 09 Apr 2026
 00:44:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1775717959.git.tomato1220@gmail.com> <ba0845c590eda42a28b3799a6f40294ba74a726e.1775717959.git.tomato1220@gmail.com>
 <a1e24b69-b90a-47d7-b952-bca45fcc6281@kernel.org>
In-Reply-To: <a1e24b69-b90a-47d7-b952-bca45fcc6281@kernel.org>
From: David Wang <tomato1220@gmail.com>
Date: Thu, 9 Apr 2026 15:44:43 +0800
X-Gm-Features: AQROBzCF7F3D8qQZzH4nVF7DtpNul6eHMhQM5j4hlrJJj6BRCmL9I0ox9rpAVNY
Message-ID: <CADSQSY1rAnZ69JAjosV_AWBw9OL77dyzHkewW5YGvpCZRwXq5A@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: rtc: nct3018y: add nuvoton,ctrl-reg-val property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: a.zummo@towertech.it, alexandre.belloni@bootlin.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, andrew@aj.id.au, 
	avi.fishman@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	ctcchien@nuvoton.com, mimi05633@gmail.com, openbmc@lists.ozlabs.org, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, davidwang@quantatw.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6306-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[towertech.it,bootlin.com,kernel.org,aj.id.au,gmail.com,google.com,nuvoton.com,lists.ozlabs.org,vger.kernel.org,quantatw.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomato1220@gmail.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: EDE8E3C7307
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Apr 9, 2026, at 15:23, Krzysztof Kozlowski wrote:
>
> On 09/04/2026 09:21, David Wang wrote:
> > Add "nuvoton,ctrl-reg-val" vendor property to allow optional
> > initialization of the RTC control register (0x0A).
> >
> > This allows platform-specific configurations like 24h mode and
> > write ownership to be defined via Device Tree.
> >
> > Signed-off-by: David Wang <tomato1220@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yam=
l b/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
> > index 4f9b5604acd9..0984dfb77170 100644
> > --- a/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
> > +++ b/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
> > @@ -24,6 +24,10 @@ properties:
> >
> >    reset-source: true
> >
> > +  nuvoton,ctrl-reg-val:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Initial value for the control register (0x0A).
>
> 24h mode is not a property of a board. I don't know what "write
> ownership" is.
>
> Best regards,
> Krzysztof

Hi Krzysztof,

Thanks for your feedback. Let me clarify these two points based on the
NCT3018Y datasheet:
1. Regarding "write ownership": The NCT3018Y features two I2C
interfaces (Primary and Secondary). The TWO (Time Write Ownership) bit
in the control register determines which interface has the authority
to write to the RTC. We need to ensure the interface connected to our
SoC is granted this ownership during probe=E2=80=94especially for factory-n=
ew
chips=E2=80=94to ensure the RTC is writable.
2. Regarding "24h mode": This bit determines the internal data format
in which time is stored within the RTC hardware. Setting this ensures
the hardware's internal storage layout matches the driver's
expectation from the start.

Best regards,
David Wang

