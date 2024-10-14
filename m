Return-Path: <linux-rtc+bounces-2184-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F6F99D3AF
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Oct 2024 17:42:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC6A9283FE0
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Oct 2024 15:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF8061AB505;
	Mon, 14 Oct 2024 15:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GtXDwrvv"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01E61CA8D;
	Mon, 14 Oct 2024 15:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728920374; cv=none; b=t/+bOneQogSDAvAhtbML3vjaJDaDdO4yppm21Fx0pArvYJTy3bFSxKKXddpR/wiXxUXoYMybpfhqwIi6/PJWbCe82htUmJk5BrgvTkSEf/mMTd5zzWY2+b3ylC5nAEKfMbLfHwtXBujKCueLjiQJThJHXnRbL4k7x8O6iQj8vTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728920374; c=relaxed/simple;
	bh=pvVtIDdO5SfMie22I6dQ5ZoF8IEreukCl41nQZVF0kA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fjPviMP47UbSfpSRWP1q4iKTBWYf7fp+1ni6Yzsq04veneFL8IT8f3Jzo8O484QFi9Qaigva/+RZX5ukJS4uf79xhzpda+OTdCDqiy/H0/ycY0dBN1oMdLpYqjncU1ECIWVhyXTecsYnbEHYEKSGTn9Ty8BdKg4dN4VeGUo7fYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GtXDwrvv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 507D6C4CEC3;
	Mon, 14 Oct 2024 15:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728920374;
	bh=pvVtIDdO5SfMie22I6dQ5ZoF8IEreukCl41nQZVF0kA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GtXDwrvvkkWVCokbyj5g3eoYbDBbzbI3xFYdq8ndJIrI0DQ31TD5k9sC0AhVFfs2P
	 gjx45pFcWE5i4lp30wsMI7fkmk5ZI467ITf9mD7usUCo8fWep9NHhcQEAH/22xnULt
	 fD41a4FknO3cmSRUUfA4nilQ6MTeSLfEb7Z7xNdupr5Ec0ogsBST5hz/LhD5jVVXZg
	 E8DlObHmjiYvBAzlr1p5lOg6GrWi7GkCKQxO1+Jd6dKLJQTflUew3Q91s8ZPYto4ss
	 exKvcO9CdD+oUQr1Ti6fz8DOEdut3EWGQf2xTe7bfAk3zrkq6M6SjLpVJpuZv6nmf7
	 f/8whTJHOUyCg==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb3debdc09so17375431fa.3;
        Mon, 14 Oct 2024 08:39:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU1mUVoB5pFQUbnGlyFQbABTxAb5qxPzSmzh+71eW7Orc3QULJhuNrY8VhE48jlEgkOuq9A+RZjyjVybxrK@vger.kernel.org, AJvYcCXImTrKL7nDCOUcCGMvCIWVpMDTaNaw3kYQBXPYmfAgRHXbrySm83Ng7ETH4S2VBlbkE7+Vg/s7uOpB@vger.kernel.org, AJvYcCXM5ToRfIDF+kbgQhEVb7UTX/F2UYfMPNfUtrQZPkAO9TRWjEt28v1/rE/0XsIv5geghRuI3gYNRtmR@vger.kernel.org
X-Gm-Message-State: AOJu0YzbTIspe/nYQUxz1DDIncervbx2sZ7H9KmtjcDKZvSvnuHQG+09
	NGLzkzUK/q/5jqP+c0WNk8jmBApnY+ABqwN3y7b1PO6XgJx949S/Il41aV0psX3oe2m6bLHThdK
	P9OrQaT7GvvTCLKrPKIbkGSO2hQ==
X-Google-Smtp-Source: AGHT+IHyvDOz79WQ+tBvAN30x1sZz8yZvi6aMoulot7icbs6+3B7f0B+uvlcr/FR4oxeCFYdrOuz7nAj6KUA8YBKJ8M=
X-Received: by 2002:a05:6512:3c92:b0:536:9f72:c427 with SMTP id
 2adb3069b0e04-539da4e12dfmr5233603e87.28.1728920372700; Mon, 14 Oct 2024
 08:39:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241011100608.862428-1-alexandre.belloni@bootlin.com>
In-Reply-To: <20241011100608.862428-1-alexandre.belloni@bootlin.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 14 Oct 2024 10:39:20 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL=OJss3kudaQBx==g2zBiqtsbWJZ5oOFWJF-vLCQZ+yg@mail.gmail.com>
Message-ID: <CAL_JsqL=OJss3kudaQBx==g2zBiqtsbWJZ5oOFWJF-vLCQZ+yg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: rtc: mpfs-rtc: Properly name file
To: alexandre.belloni@bootlin.com
Cc: pierre-henry.moussay@microchip.com, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Lewis Hanly <lewis.hanly@microchip.com>, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2024 at 5:06=E2=80=AFAM <alexandre.belloni@bootlin.com> wro=
te:
>
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
>
> The actual compatible string is microchip,mpfs-rtc, not microchip,mfps-rt=
c.
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  .../rtc/{microchip,mfps-rtc.yaml =3D> microchip,mpfs-rtc.yaml}      | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename Documentation/devicetree/bindings/rtc/{microchip,mfps-rtc.yaml =
=3D> microchip,mpfs-rtc.yaml} (100%)
>
> diff --git a/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yam=
l b/Documentation/devicetree/bindings/rtc/microchip,mpfs-rtc.yaml
> similarity index 100%
> rename from Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> rename to Documentation/devicetree/bindings/rtc/microchip,mpfs-rtc.yaml

Incomplete. Now next has this warning:

/builds/robherring/linux-dt/Documentation/devicetree/bindings/rtc/microchip=
,mpfs-rtc.yaml:
$id: Cannot determine base path from $id, relative path/filename
doesn't match actual path or filename
         $id: http://devicetree.org/schemas/rtc/microchip,mfps-rtc.yaml
        file: /builds/robherring/linux-dt/Documentation/devicetree/bindings=
/rtc/microchip,mpfs-rtc.yaml

