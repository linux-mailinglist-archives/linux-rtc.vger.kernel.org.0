Return-Path: <linux-rtc+bounces-3490-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4E0A60BF1
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Mar 2025 09:41:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E3AF1896FC8
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Mar 2025 08:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D4591C84BC;
	Fri, 14 Mar 2025 08:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ppII+Vh3"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3FB1953A2;
	Fri, 14 Mar 2025 08:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741941670; cv=none; b=DoyRcVFbnQ4A/jN/TL4a6MR6IIwfF06RB09q9nP1VmxMgU+PzbZpXlJB5N4FaWBx/ilH5nyQGcjdWN4++DMdyzeHhYtPl5skMvtitzeeAGRoGWYZrVJQx6is76yv1Yq1cgX68MJujHfjTFSGY91yb07WQXrJAN5A/zeiTaXWfco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741941670; c=relaxed/simple;
	bh=mA2n2r88FjBXxm6Nj4z+GrSjmJVmL/AW/BggpOMvC30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SjO0AqkDWRfiCaroaSVIDm3/No237UZUB/DYI3RoKBfL4J3HpRa7PgQlOg+YmdaFDoO4Er/XHpIfgAyf9x27miwm2s2eAMmHbeutYk0icisTTso+IH3IQZXPfELv0WtmpM+t2HdNJUeIeqRBeSpBizXvF5GHw5ZpHIJFt8itXio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ppII+Vh3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFE6CC4CEE3;
	Fri, 14 Mar 2025 08:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741941669;
	bh=mA2n2r88FjBXxm6Nj4z+GrSjmJVmL/AW/BggpOMvC30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ppII+Vh3YT5m5l2d0pCDeXAi5aNCRjPCPdC/HZKCn73+tC3JquGWwETN0+38UXMdp
	 OSvU9xAQSAo5ZjfanLabvTK/NAzEemkCTeyBxkdjNE/tsp3U9Hswq/HtFGB7PLCDha
	 S3D/Fo49vvcYrqITjtyOI6HuYL5h7tpO33kNF5p+JnnI34Vz2Z27oKSpOUWT7KeQ8r
	 3oK8PVMxVE+BAxdqEbdCB1fp9w7GZg03JRm1kO0rDpvD7pA0BtB5ApFxhdr5noJEoK
	 hTmC5QM0NrFn6CKG7Vo0IaYLpQ1sBbX7CseUR8JEVUt3jaMgusn47biIbV/S93Ng2Z
	 CzmzVlT7pfUxQ==
Date: Fri, 14 Mar 2025 09:41:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [RFC PATCH 1/4] dt-bindings: rtc: rzn1: add optional second clock
Message-ID: <20250314-sexy-impartial-raccoon-7e8dca@krzk-bin>
References: <20250313102546.27335-1-wsa+renesas@sang-engineering.com>
 <20250313102546.27335-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250313102546.27335-2-wsa+renesas@sang-engineering.com>

On Thu, Mar 13, 2025 at 11:25:42AM +0100, Wolfram Sang wrote:
> The external crystal can be a second clock input. It is needed for the
> SCMP counting method which allows using crystals different than 32768Hz.
> It is also needed for an upcoming SoC which only supports the SCMP
> method.
>

Probably the binding was incomplete and you always had external crystal
connected. I assume you want to keep old DTS, so it is fine for me:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


