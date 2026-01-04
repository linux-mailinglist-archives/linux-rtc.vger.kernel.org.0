Return-Path: <linux-rtc+bounces-5643-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1717ECF100F
	for <lists+linux-rtc@lfdr.de>; Sun, 04 Jan 2026 14:37:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B39AA301B2E3
	for <lists+linux-rtc@lfdr.de>; Sun,  4 Jan 2026 13:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85F5430DEC0;
	Sun,  4 Jan 2026 13:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tnCiFKOp"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB7230DEB9;
	Sun,  4 Jan 2026 13:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767533799; cv=none; b=N4g/hLS+MJNK8SYvYliPECtIfbRSh2Z2V4ZqbisSQd4QyyRY0Wh+PmkZ2LAO1cGBhdVs7fapY3g/5yxnEjYSSyuWBu5my/lWZDDR07uRLJavPrE5PgweleKiAOqOdH36XqWjI1/DKRqN0N7mkEAj31oxDMzs1uGxxJzVQOT8ADU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767533799; c=relaxed/simple;
	bh=naLJS8WyK6kZP9mF3rC4ydPwB/R6y+R7Ma0ZYpvsGFM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=jVVAMoU9jO1J9jGWNdiNnsxodHvn+5aWhTUW6z/ZyKCUtzaupOGHjFb35raxuv7KSbk9ZKjPx9hI3n17K9ixNzfCI71AQSPboex2Ac7GpnZqiHMKjfC1iwfh1Iy8DXvgof+9R7PRHS6leLbIRzJiU4shIFD38mS/DUnifmXHWtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tnCiFKOp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D4CAC4CEF7;
	Sun,  4 Jan 2026 13:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767533798;
	bh=naLJS8WyK6kZP9mF3rC4ydPwB/R6y+R7Ma0ZYpvsGFM=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=tnCiFKOpYac1xSd1VZH6+5a8BsIHrKqdMVT7yiCeD94gUeYoErrQ/0yBwoAnmxTqb
	 cz1q3ztGJqyEran/Y956LZEqKYopM9mU2ygEVy6nfj5v9dm6LNOB1/xm8qZ/DALHyh
	 e+tJF4I0FMKOFIj4tSlSZdPQ/ND9R9i7eUS28qRfqAL+hGFknV41RB6AehoxU+6tUN
	 /2LRLmv9GPs/Qo1X1TZRzRheaPBZN+tKaeL7t/3NzsUi8FINlKnumJD9GWBZG4JMaL
	 FVuVcymtuCdJLlOJtaqJl2yDzsc80cusIxgxHZLNtBYUx17e3wgrVzrXuuTi2OYR2f
	 pquXlktUlNQEg==
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 04 Jan 2026 14:36:34 +0100
Message-Id: <DFFUFRMWKRMO.INAMUGECPSQU@kernel.org>
Subject: Re: [RFC PATCH v1 0/4] rust: Add RTC driver support
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <linux-rtc@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Alvin Sun" <sk.alvin.x@gmail.com>
To: "Ke Sun" <sunke@kylinos.cn>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260104060621.3757812-1-sunke@kylinos.cn>
In-Reply-To: <20260104060621.3757812-1-sunke@kylinos.cn>

On Sun Jan 4, 2026 at 7:06 AM CET, Ke Sun wrote:
> Ke Sun (4):
>   rust: add AMBA bus abstractions
>   rust: add device wakeup support
>   rust: add RTC core abstractions and data structures
>   rust: add PL031 RTC driver

May I ask how much of this (if any) has been generated with an LLM? Going
through the code I saw quite some patterns that made me curious.

