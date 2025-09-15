Return-Path: <linux-rtc+bounces-4907-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CCDB571D5
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Sep 2025 09:46:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80CBA1895927
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Sep 2025 07:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD7982D5C7A;
	Mon, 15 Sep 2025 07:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V8n6zf7B"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1B1246BC7
	for <linux-rtc@vger.kernel.org>; Mon, 15 Sep 2025 07:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757922388; cv=none; b=r1j+/p5hGs0Ht01tN+XT23AVzNVKLWzpd6YzR1j7xshPwuUf6UGCobSTfkm9R3LETPfZRigKLK3nobeZpnaBNKqYL4436wIZ4CioDSXP1chrmk8bANSWMSgN8u/3iU1pcd81ORulkViXD0ZxeHJ9Ry7jyXewa6ODeLHpAExGuus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757922388; c=relaxed/simple;
	bh=rxgBGv2zMZRxz4TM397vl50YX+5rV/wH6l1JB5uVKT4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cdX7WAx31XlINhdO5F9wW6p7EJR96SfnnS1Hgmpz/5cPNnv5ePlAjMJanqVqgmFYWHPuzno5d3t422x7nM7+mqiUt4OMzTAmdULUt60ZXi9qnUsS0sE6mQ3BHOfgPqmqn0R/ay/UVbneONE3OFJIrDP5uy6Hj3cySC0+bJAUkng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V8n6zf7B; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3df726ecff3so2069209f8f.3
        for <linux-rtc@vger.kernel.org>; Mon, 15 Sep 2025 00:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757922385; x=1758527185; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rxgBGv2zMZRxz4TM397vl50YX+5rV/wH6l1JB5uVKT4=;
        b=V8n6zf7B2GCu6e2opOUBFBhGIpz5wG0nHLqtXHW2OD3gyMT+lEotEp5gupeb4Z5Wfr
         gNojRbFUEzisxILvPenML4ZLC6QiuoSS1wjKzUd2ob85vpmuTmNmqlKhbOjrhnLZRl7I
         9zSYiqXxh0X/r1kKhByZR4eLWGFP5XvWPbHn36MXcrftKeOTeSutuLTRk3Hw8FMOA840
         gfiImqfIzJNeZJe4dGP7dZc6NpnCjRl5KiFoWq6hQSjqU8+n8xCoXPd1iMk9Fo0MCYHh
         U6FqY6h7jPfRFV5sPasorwF6FL8mdB9hLYBeisVBWo6zA+0GJw12GohQKBTipHZSj9JJ
         kBhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757922385; x=1758527185;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rxgBGv2zMZRxz4TM397vl50YX+5rV/wH6l1JB5uVKT4=;
        b=s40Is5dU7n0X9miTBfA9ZP+Z+WwbjbBNCv+kQFUsaZjXr52R8YoaidGDCPSGFd1LI6
         Zc1DHc3saiCBbRWhtXUKYcFdq2OGas56MRYbpcNpz6ti8vtTZJh62PdzCmXxhMmzAT3D
         X2YDz8z4PFpergXlm6IFSItE9w/W4D+WXArnj0U/OhEP1BQdM1sQ28bpcn9QV4//9fM9
         w0Lna7efuCTnhp2DYYDcBAJV1aelYulW8q2Kx13NQ/Gs1o0lNB8Mrv5S5GB4IRN20jzg
         vNv2IQD7l1QCaO/HONcXtl342T0act/X0s+ckEhC7kwCeF0EkrdEzUb4WxUMUuHM9juG
         iaFA==
X-Forwarded-Encrypted: i=1; AJvYcCUazVLM1pmnKwyi7H9IzDUUpOdGmQHzd2etDKH5GGdPz4CnGNOq2yIFBZH0SxUIlK9ZYQHmBT3YkAw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuubgTXVXoNbOdBI0eTNQ9ZSBOcW9OcQACbkt7ui5PbBapymYH
	dlODoG2zZ7inwOW/qoRQ8VAbmKt8cooLC9EwZ9K+xMf98CIflBHIQ2WDfiYdn/GCFU0=
X-Gm-Gg: ASbGnctQxsoOxAEfJ6AnDm0tWuQOkBLBMeLbiPc/mxLDFmADLJAZj0PTJJPwnSlETTs
	KzV7PfOd/Q7tT/8lysE3o7ST+JbaNWOdvbyf7XKBQM4foJgtZI0E4ceXQgBspbaFilBYdhdKp8J
	YeQnhwCqjJ7Jnr3yDoexVl5n5O/iKpjWNPWKgc18dQSSdfD7oiyr22w5B74YH5f/7smNNM+SnRO
	6UPwiOeusVRktBHtCnwfezzaY9+dSTsU/gwPw4w1w/XxMY7VKpH9QnhD8ARWNaxR5v8Savw7DHi
	gWnF933Fnvj7UctZv0jLoAPwHPpjUUaFVnpZHT+oSUgY8kYZdgTWF9s4IGVyl/b3zVVChJIoEie
	W7z3AWdo4Cskpga7zNrhpN9Juig==
X-Google-Smtp-Source: AGHT+IHyyuLf6J5x2h8+77IB2PsvJAJV4Tes0P0hl/pG4jVOFAqE/MRdKs5G4GFgkNVlw9YzjUjKhg==
X-Received: by 2002:a05:6000:26cc:b0:3e7:458e:f69 with SMTP id ffacd0b85a97d-3e765a08312mr11049943f8f.56.1757922385224;
        Mon, 15 Sep 2025 00:46:25 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e9c2954b10sm5452113f8f.50.2025.09.15.00.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 00:46:24 -0700 (PDT)
Message-ID: <62d7c5221b9598f390102f4db8db483af9f34289.camel@linaro.org>
Subject: Re: [PATCH v1 5/7] clk: s2mps11: add the support for S2MPS16 PMIC
 clock
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, Krzysztof Kozlowski	
 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo
 Choi	 <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 15 Sep 2025 08:46:22 +0100
In-Reply-To: <20250914124227.2619925-6-ivo.ivanov.ivanov1@gmail.com>
References: <20250914124227.2619925-1-ivo.ivanov.ivanov1@gmail.com>
	 <20250914124227.2619925-6-ivo.ivanov.ivanov1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+build2 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2025-09-14 at 15:42 +0300, Ivaylo Ivanov wrote:
> Add the support for S2MPS16 PMIC clock, which is functionally the same
> as the currently supported ones, with the exception of a different
> register.
>=20
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

