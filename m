Return-Path: <linux-rtc+bounces-4707-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2D9B2AD88
	for <lists+linux-rtc@lfdr.de>; Mon, 18 Aug 2025 17:58:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59F99561E9D
	for <lists+linux-rtc@lfdr.de>; Mon, 18 Aug 2025 15:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 290AA322DD2;
	Mon, 18 Aug 2025 15:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CPEsLYFv"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B0432253E;
	Mon, 18 Aug 2025 15:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755532619; cv=none; b=ZYNiwEcIWMVkxMpXhzYAiEUdDy6Yepy3i+kEucfAufDFZ3jADq5IW7wk/2klIht5GaL8FQQNpxTuG5Gr8CZK2N3yD6GR+VxK0U0pXtbKKhZRkpb0PVDMCe3QerPq860jvO0FFkaLitQ/OEDKw0zm+K2M+OQpMv+dfkPefLf0yZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755532619; c=relaxed/simple;
	bh=8d4JxUtDdmnFSWMSh4kLNhDj+8WZAbO078i8EJPbAOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U2ndvnZrLOmGjSfenQDcEcERe1fkQXOsLqIkyKwGM4A+yWsNDX5Zswo5uGRFXsBGXbl6kAIY05EBBDdatoC14rdFkFTsLXFAmpA9yY15k5p8b/9zC90M+6fVP4nRumdy3exft0VIFiCxEivM3ZdIvDqRb4+DX3WvFXYmoctyqkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CPEsLYFv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 463EAC4CEEB;
	Mon, 18 Aug 2025 15:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755532618;
	bh=8d4JxUtDdmnFSWMSh4kLNhDj+8WZAbO078i8EJPbAOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CPEsLYFvKxO45JN/BaXfFUFR2Bye+1F8P7XrRUe/tNgDzsnVUYNujcDZAxN4FtQNE
	 iqj3UBvVfZfxULxNnnqdnF9FvtzbmJnMkRX0TE2olkdl7qg9HDR+euP3DA7n1E92Rq
	 VNDR3AHZI/z2AAfg6vGLMEVtlSBCrJa4brw5SYWBmgzBacdjbe28MvlX4UVRdF1Vzx
	 C0o269GyOj5wJ5cU/PlrLvF28hJgTAS2oLXSMG7lYv3IhUa2Kft6QkoCeB/Po2QJUB
	 WdlU81wDen413BusE1tw1DsZ8tzybTBOcxOWx7a+af9hPEXZiYgcn5Yx3zXaFiYtS+
	 IRbQI7rzyc/eg==
Date: Mon, 18 Aug 2025 10:56:57 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: shashank.rebbapragada@nxp.com, linux-rtc@vger.kernel.org,
	priyanka.jain@nxp.com, linux-kernel@vger.kernel.org,
	conor+dt@kernel.org, alexandre.belloni@bootlin.com,
	vikash.bansal@nxp.com, devicetree@vger.kernel.org,
	krzk+dt@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: rtc: nxp,pcf85363: add timestamp
 mode config
Message-ID: <175553261709.1300451.5942152829890999372.robh@kernel.org>
References: <20250811082123.1099880-1-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811082123.1099880-1-lakshay.piplani@nxp.com>


On Mon, 11 Aug 2025 13:51:22 +0530, Lakshay Piplani wrote:
> NXP PCF85263/PCF85363 provides three timestamp registers (TSR1-TSR3)
> which latch the current time when a selected event occurs. Add a
> vendor specific property, nxp,timestamp-mode, to select the event
> source for each register.
> 
> Also introduce a new header 'pcf85363-tsr.h' to expose
> macros for timestamp mode fields, improving readability
> of device tree file.
> 
> Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
> ---
> Changes in v2:
> - Addressed review comments from Rob Herring:
>   * use $ref: /schemas/types.yaml#/definitions/uint32-array
>   * tuple form with exactly 3 items (TSR1/TSR2/TSR3), per items decimal enums
>   * define 'nxp,timestamp-mode' clearly
>   * drop watchdog related vendor properties
>   * remove watchdog related vendor properties from i2c example
> 
>  .../devicetree/bindings/rtc/nxp,pcf85363.yaml | 23 ++++++++++++++-
>  include/dt-bindings/rtc/pcf85363-tsr.h        | 28 +++++++++++++++++++
>  2 files changed, 50 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/rtc/pcf85363-tsr.h
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


