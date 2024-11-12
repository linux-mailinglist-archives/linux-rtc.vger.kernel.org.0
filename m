Return-Path: <linux-rtc+bounces-2533-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 550449C5AC4
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Nov 2024 15:46:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DB1F1F215D4
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Nov 2024 14:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03FC01FDF91;
	Tue, 12 Nov 2024 14:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PryHmpLd"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E491FBF79;
	Tue, 12 Nov 2024 14:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731422728; cv=none; b=ULz5r6tUyKuNYf6Mw3FemqT2OGap2Pzm3RrDuIlmdP2WjTnD01IyDJ+b8q8X0lfMuBM2amqkh940v62f6rSy+Zfgu7VVnDYaBNMQPmUVWq34jpZztoixGB1GU5Ta1W7C+ZuLZ07vOFtbGPbkUEJaFgFvZC1SYwBe1uYWDKIGne8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731422728; c=relaxed/simple;
	bh=4DTzZviNMUgLM16PkuQSDcAJyrHH7thkYlZicAdGBD0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ObToeYnLYWSrkvYhjaeGCAAoR9k6mqOQ9e9dowUPfaETSJ4ETw+2TIlV29h07s9r/BGwq3FhwleznaLsBfn4LElfzBb3fPzuB7xz9qoPXzi6BHjIomsSbnA7RQGBE/8ru6z/ODnCbmkF5IttdBwFHV4on161uCrcTL023fc5SUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PryHmpLd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC134C4CECD;
	Tue, 12 Nov 2024 14:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731422728;
	bh=4DTzZviNMUgLM16PkuQSDcAJyrHH7thkYlZicAdGBD0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PryHmpLdIxk6dO+WIIu2UCi8OEzEM6L0QtodQjAS3u6Uvl4VjIG4RZicaELMW7nMd
	 KWh6vXOcEKbELPSWdumtrM8DzUwLQtGaYYczo2xywNkJSFKXrwwy5zYj1a2X1be/7D
	 C3YpMqfxWOY7He7puJ/HIZujStaDaPQkVDwUQFGlJ10aTBMGEoP89h4Me19XI79r+E
	 lbB5cxf54Jl9leO9ff0qdel3exU8/8Yuo5GPXW6Pxt3u0TZNuTuoafuksUaiFhcw8k
	 wUNDXEIdU65VB6K+0Y1qoCytlpf5Qgv9QEf1m9KnH1Y7+mw5aYOVoxFN/ZzUBsTYan
	 EF2dKr9bSSjtw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 Karel Balej <balejk@matfyz.cz>
Cc: duje.mihanovic@skole.hr, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht
In-Reply-To: <20241012193345.18594-1-balejk@matfyz.cz>
References: <20241012193345.18594-1-balejk@matfyz.cz>
Subject: Re: (subset) [RFC PATCH v2 1/2] mfd: 88pm886: add the RTC cell
Message-Id: <173142272657.1051767.11499156324006746710.b4-ty@kernel.org>
Date: Tue, 12 Nov 2024 14:45:26 +0000
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Sat, 12 Oct 2024 21:31:38 +0200, Karel Balej wrote:
> Add a MFD cell for the chip's real-time clock.
> 
> 

Applied, thanks!

[1/2] mfd: 88pm886: add the RTC cell
      commit: 156d87b679a565a166da4a7ce892cb87f6317faf

--
Lee Jones [李琼斯]


