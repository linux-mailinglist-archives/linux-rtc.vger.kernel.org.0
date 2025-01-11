Return-Path: <linux-rtc+bounces-2876-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C42A0A2B1
	for <lists+linux-rtc@lfdr.de>; Sat, 11 Jan 2025 11:20:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DC181696B2
	for <lists+linux-rtc@lfdr.de>; Sat, 11 Jan 2025 10:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E62B118E75A;
	Sat, 11 Jan 2025 10:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Edg8qiQI"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FA416B3B7;
	Sat, 11 Jan 2025 10:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736590806; cv=none; b=pw0F2orcqd96b6+CKrWiCiv/QARb4kk/WqNdiNnTbhuWhfdk2Zrr4MhapDXSzxXmPnT8le6aRLird2tmwRZ2/p6gM6tlva3goLMMs4zBpmsme3JNOqDORjKfSl+OldyGgfrIj0SaB/iW/KXy4ay/Lll/RaD8d507HGzxVDrzshA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736590806; c=relaxed/simple;
	bh=ErF6qTjaDylSERiT94zwG34RsKcop+43SFnBa9gU8mo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E5NMySsD5VfzbKqFyRTN3Rciyu78+uymh0yZyPAZce/xBVFXVqjKkn6sMgjNsjzjZz2mV48OzEwQsx53VbK+PtDfM0KNZW4AYl9KS7sfHFU6mVuNBWw0X9ueS+zzHy+sW6NhFB27MJyom7Xg7AU6G06WfWUoITPryY+1OPqm558=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Edg8qiQI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A25FCC4CED2;
	Sat, 11 Jan 2025 10:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736590806;
	bh=ErF6qTjaDylSERiT94zwG34RsKcop+43SFnBa9gU8mo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Edg8qiQIZ+AV/NzhKQjd0OHFQazOKJCwW7W+2eN/XEuSgYG2zkD7vqqstD/CROM8s
	 bw1oifcA+vT/EgSxWa4RgbyBQKRSzSQUIwvSZ4CST/e9WC9vZhxKJHnsd+g0kByIa+
	 I+2Jtjg5mk15xnjqJVuduW9b8YvENiZjGjhxmE3oxtDKaUhyygbYsq/gABF9gpaGfY
	 VxZXjJ7+Etc2duH7+04bE1KvNyXDBZGZHlqsbo7lKKp9trKLZJMQgMLK463TYOBoJG
	 w1KKeT5dXDBv2puabsspOXIS3MLbUkCoTzXRxhI4CSh9CcWFwLJ/iBUL2sf0ArKDCc
	 SjhJpz6na0VwA==
Date: Sat, 11 Jan 2025 11:20:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, Manuel Traut <manuel.traut@mt.com>
Subject: Re: [PATCH v1 1/7] dt-bindings: rtc: add new type for epson,rx8901
Message-ID: <f3fcdxudnvelodokliir3dreg3vqze3ds2aixuasljkl43wir5@evbfwgmxich3>
References: <20250110061401.358371-1-markus.burri@mt.com>
 <20250110061401.358371-2-markus.burri@mt.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250110061401.358371-2-markus.burri@mt.com>

On Fri, Jan 10, 2025 at 07:13:55AM +0100, Markus Burri wrote:
> Add new compatibility string for the epson rx8901 chip.
> The chip has input pins for tamper detection.
> This patch add a new compatibility string for this type. This is

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

> needed to enable the functionality for this type of chip.
> 
> The compatibility string is defined in the driver but not documented
> in dt-bindings.
> 
> The patch also add compatibility string for epson,rx8803.
> The type is supported by the driver but not documented.

All four sentences keep repeating the same, so just:

"Document compatibles for RX8901 and RX8803, which are already used by
the driver."

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


