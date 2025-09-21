Return-Path: <linux-rtc+bounces-5003-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4295BB8DF92
	for <lists+linux-rtc@lfdr.de>; Sun, 21 Sep 2025 18:28:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EDD31899FF2
	for <lists+linux-rtc@lfdr.de>; Sun, 21 Sep 2025 16:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97ED123ABB6;
	Sun, 21 Sep 2025 16:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l6vRkRZ1"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6327F27472;
	Sun, 21 Sep 2025 16:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758472078; cv=none; b=LG8RUXo+bJj59ks+ZC/PVlZW6vk2B8b/e4QfU9cp7EkORLdFeaXsx6Pt3PRk40cxHeUczTbLEQCrYw4JoE0bijyVDv8X94KGDjgEKHRR9AWVONjPCQ2KzF+6SEdf5u0zZibPIgMSWf1sNjKaE4MUFRB3yHutwxbIx7S24+ltzuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758472078; c=relaxed/simple;
	bh=VHjkBvbqZ5o8imS+SGgu+1L6aGtPHRflhg6z2PHfNv4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=I0Rnlh0kp2S6NWvavxehTa0seQOW7ZsBGwghqJ45Umgoo1HJaH3WucNAkfmb8/4POjksDWseUrxK6YXzB1KEhkxIe5kqDxe3/6CvbqnFp/SdkNuwXmCfzXBfPOfLzMXv5sC4Z2pcCUAbP16kYs2IW9l7Lwho6lnAURRzWYHZvOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l6vRkRZ1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6E9CC4CEE7;
	Sun, 21 Sep 2025 16:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758472077;
	bh=VHjkBvbqZ5o8imS+SGgu+1L6aGtPHRflhg6z2PHfNv4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=l6vRkRZ1uy4qdT1tSUwg7LeQAq1eJMIw9rGRLdPQxFe+CpXvbx2KUWi7RuF8nkicu
	 +W149I2Rro7xLz0aze04vB9nRG+cG1wOePKtaxgpW4BbUKr96oDJp6pvyuzsBHjVer
	 GFQuS5GZ0gvc79pfk9027yghS6UE74tkhRYKNl/6jBoDyBQSjykacidaG++gdb9FwR
	 tK6wo4F+UySlBqZ/9ut9awXK0BSKDsx8DbAQhYxVy4pzyINWyvY4mG+N0emQiT7DXx
	 UlV1f/sHkJpApluHJkIIq9mqIi8v9iPk3pqqul7dw1HMkq0MSdrNLqcVE/+9NTsgvy
	 7qzrdoJeBwcoQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250914124227.2619925-4-ivo.ivanov.ivanov1@gmail.com>
References: <20250914124227.2619925-1-ivo.ivanov.ivanov1@gmail.com> <20250914124227.2619925-4-ivo.ivanov.ivanov1@gmail.com>
Subject: Re: [PATCH v1 3/7] dt-bindings: clock: samsung,s2mps11: document the S2MPS16 compatible
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Alim Akhtar <alim.akhtar@samsung.com>, =?utf-8?q?Andr=C3=A9?= Draszik <andre.draszik@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, Conor Dooley <conor+dt@kernel.org>, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Sun, 21 Sep 2025 09:27:56 -0700
Message-ID: <175847207656.4354.7306628769778597645@lazor>
User-Agent: alot/0.11

Quoting Ivaylo Ivanov (2025-09-14 05:42:23)
> The S2MPS16 PMIC, alongside regulators and an rtc, provides 3 clock
> outputs, just like most of the other S2MPS PMICs. Document the S2MPS16
> clock compatible.
>=20
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

