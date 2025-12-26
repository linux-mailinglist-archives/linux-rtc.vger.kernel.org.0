Return-Path: <linux-rtc+bounces-5621-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5670ECDE916
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Dec 2025 11:04:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B57003007C59
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Dec 2025 10:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 531ED347C6;
	Fri, 26 Dec 2025 10:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F4pAphAH"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708F11494A8
	for <linux-rtc@vger.kernel.org>; Fri, 26 Dec 2025 10:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766743445; cv=none; b=pH7COfMyShZ9r6AP87mj7BN0DX1DUfIvOZsgslnUyBNS0jdF3S+BSY3crZJ3JCwoAr/DKYj9gNigxv8b9OpCz+1sks3M3alZWm0gREaACknYBC7A1Lb0saWRIwqGsXr3Bbvoqj7BhSGGwF0yANj1CHQqt3SqUmY92HYAZChW5Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766743445; c=relaxed/simple;
	bh=bsPlTRK85fjjyDDqOcgY783Uyn44b4lPb1UUHMFZ/co=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XvGR1GYl7NWvY5qod4FJ/7RbR7jn9URYhetqK4uLRX78koaWiXf0Oe1drALWqWd+Ijoek2DYT3d4MgHw+32VXBwoce4nFV2ujaISVq352hx++bApPWkJDwdexDOnGjMYNo3kKrWygvgwzd9xbudA+rD1rVGKWdhmUL0DTbWdNMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F4pAphAH; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59911cb8c3cso7865129e87.2
        for <linux-rtc@vger.kernel.org>; Fri, 26 Dec 2025 02:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766743441; x=1767348241; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c56xVey+/P0K5DvPpIeRFr1NM6R9NaOEhrxube/Xe6M=;
        b=F4pAphAHLtPt1+EInHb/X79ez2KY7kAuFDM9wt93bNd1lNSNWQj+qVE0vgK8hRnWHT
         ZJFkPfMqZ7fSeL0GAtpCUdPGMm2bWr9/7XcmEEjHB5LBI3wVsntDxD/h411GwcODFDmk
         6rdSGXWBQCwBVhEzgvSQ9VnYE3ghuTI+tFT+v4MBVzoz4zCzWaf7PNl+JWLVfJfkwPYL
         0Bq7itlnd1N0u/oT4QhAh6Ephwy4TKPlogzrzlPzyptsT3c9wRcFZu0rofat10/a5TOa
         qXiT4jJ3/45iV5hfhnmp0zOtyYIP6IulEq+0qS1CmC/MJV+E/KyFccyhD/3sCyphuzZC
         azAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766743441; x=1767348241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c56xVey+/P0K5DvPpIeRFr1NM6R9NaOEhrxube/Xe6M=;
        b=BtYi3Ftrsq14RWm7vDAqmPzud25f3yryeQRIM1a4g5d0MioQiEzGA71kesu5fL/w/S
         RWRKjm8Uz43r23Y1A70wgYinbLVFXCFpR4odPv9w00PpLirk1Z2QvIpNC2t9DCE74sP6
         pcAxh8a6ukRxlwfiHIvPpYH0DLgWn/4J8Z8xQYI72FZW4o8OiattTiziC//kzKC0NTTC
         OoUOlZiAuQh1nAL159/Ir2eAU5pPiyv0C8BWuSHCmlSH242RbCnUfXZ8OXxmTmzoug7a
         NS3ZX5vwU6pPW2V2htlALErhhoEsgfbHth9NTyGfZvSRtnjRK/2s2CojDdlwlQeHg40S
         syfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUD6uhXnBBewdK/XWudf3NckD90Y/P/5mkMK9csS3GPQwA28Zawm19eCUGTJdeF38/Ifws3kN+udWU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqKrOzIrkuTdUn98nsEORgtEtGtJcsQLGt6gjiW6qcCqzVXMn8
	vjVArSb/U36u5FX6Z7eVSn7laD5LJsyeLBqTr6iMXBZZnZL/lP1218KS4qrSQWmURuagfnCi8RY
	6o3vc5YEgwYn2M+mz6d+IiCLDB2cIj3E=
X-Gm-Gg: AY/fxX5eHwdIW+I3m1G7h/i8Il69kAcKviN7hGAMK644yg+MCl5f6A0Xi7zN/eqAuZx
	rSYTboWhR1J8z3b6o0Pcj/iM4qnJLD0uoCyIjC59EkYWia/2i9+Jyy1tEyuCfbtrKGD2P4Rgqvn
	3yHJpcGAImaCwpsCuP2uKs3cCjRdacZSvxC1uM3k3dA3A34SBDU2IAD67gTirWN9v7pNJGIkMNv
	PKYI65HrBfpuFVbc38fkQ70keEpPOi2Z0bZH3FyF70J2Sh2H29nPo2dZEzjvI0Ae+7k8hvcc4kr
	EiE9NOU=
X-Google-Smtp-Source: AGHT+IEeJtzsXB++6IhxWCem8I/iqi6tN+vUyXQQj7sGJYC2SPWAV++ictVP2fCKp10Wj5G66giWAcJxanY8UYAXGPk=
X-Received: by 2002:a05:6512:e9a:b0:595:81c1:c57 with SMTP id
 2adb3069b0e04-59a17d1813emr7434587e87.11.1766743441289; Fri, 26 Dec 2025
 02:04:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1766471839.git.zhoubinbin@loongson.cn>
In-Reply-To: <cover.1766471839.git.zhoubinbin@loongson.cn>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Fri, 26 Dec 2025 18:03:24 +0800
X-Gm-Features: AQt7F2qiUK1mpU25DWjs_X4oGOorQ76rYhxJTsfWZSC-loYSKF2H28Cd9YxqJXs
Message-ID: <CAJhJPsVMsWmiaghsyvfwGzBOoKR0Tn9gGwaT+tpeW7q+qfZN3A@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] RTC: Add Loongson-2K0300 support
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, 
	Xiaochuang Mao <maoxiaochuan@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For the whole series:

Reviewed-by: Keguang Zhang <keguang.zhang@gmail.com>
Tested-by: Keguang Zhang <keguang.zhang@gmail.com> # on LS1B & LS1C

On Tue, Dec 23, 2025 at 2:42=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn=
> wrote:
>
> Hi all:
>
> This patch set introduces the Loongson-2K0300 RTC, which has a similar
> hardware design to the Loongson-1B, but without the alarm feature.
>
> To Keguang:
> Would you have time to test the driver on a Loongson-1?
>
> Thanks.
> Binbin
>
> Binbin Zhou (2):
>   dt-binding: rtc: loongson: Document Loongson-2K0300 compatible
>   rtc: loongson: Add Loongson-2K0300 support
>
>  .../devicetree/bindings/rtc/loongson,rtc.yaml | 13 ++++
>  drivers/rtc/rtc-loongson.c                    | 65 +++++++++++++------
>  2 files changed, 57 insertions(+), 21 deletions(-)
>
>
> base-commit: 16bd954c93360145bc77cc601e350913fc28182d
> --
> 2.47.3
>


--=20
Best regards,

Keguang Zhang

