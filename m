Return-Path: <linux-rtc+bounces-4097-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D89AB5B62
	for <lists+linux-rtc@lfdr.de>; Tue, 13 May 2025 19:33:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 721F63B3EE1
	for <lists+linux-rtc@lfdr.de>; Tue, 13 May 2025 17:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 496CC2BF3DB;
	Tue, 13 May 2025 17:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uNE2eobL"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0AB12CD96;
	Tue, 13 May 2025 17:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747157549; cv=none; b=Ihyk32YiSAjmMrUkbbEsTsbyRLeEe6R4j+G5qRaE+yVg2I5xbGdoE/mW7LT+v53aGiUS/sI0V4Pa2Tsp5yLoUrkIFrqSsuJpLyHnIcgJ8KT55yURrJEsmIM0vBFD7pgQ8Okx+nOflRuM4kZBOclcfwi8nDJ/X3v2qUzLd9IRrHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747157549; c=relaxed/simple;
	bh=oKptU1HBtsc0pp97A8rYMmr8jMiJMIKnxMASOc99ukw=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Urk8JueN61dHJoc29qThwy1J0F+lDCeFN9MosWjhoyNaFs5bQ033U+TKDMui/zIS/xKltWQRKQjfFx+8iQmxI4YjYlrSLZvIZaocDiVG5+2Q3uHNzYZqqX5LcI9ni19HEY0sVkiD8v+PXLxJBwwxd1ay6G4GWl5Kvx+EZ5ygPu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uNE2eobL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 693AFC4CEE4;
	Tue, 13 May 2025 17:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747157548;
	bh=oKptU1HBtsc0pp97A8rYMmr8jMiJMIKnxMASOc99ukw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=uNE2eobLYeGPhYezKR57r1FkgEfYjVfV7RFaF8zCdW0lm1bwcclEA+0FzRWcKQnLX
	 rMh2h0vAXIU5MdnJiBWIZ2eMeEEiFymF8yDFb29s2redHJJXLrsL1SaupIIYLbaBWt
	 peXOPp462KU+jqvku/yEwM/bpuMBPXhmlwdrUnnArStJANTRpnHYVNWyRgODEUn2xJ
	 CrygbquSV6btD2Vwx9OyJzMQ3fzibAB9YO4Peuo/XguMtwY7Js6m85Zvv/+TILIfJa
	 kxCRHt7YPJJGf4dMSG3xd3JqsdCFIu5vTJwZch+EqQV2OO5zhKhIU93qpuMk3gohXJ
	 ZySvZklS98Asg==
Date: Tue, 13 May 2025 12:32:26 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Marek Vasut <marex@denx.de>, Manuel Traut <manuel.traut@mt.com>, 
 linux-kernel@vger.kernel.org, Markus Burri <markus.burri@bbv.ch>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-rtc@vger.kernel.org
To: Markus Burri <markus.burri@mt.com>
In-Reply-To: <20250513161922.4064-7-markus.burri@mt.com>
References: <20250513161922.4064-1-markus.burri@mt.com>
 <20250513161922.4064-7-markus.burri@mt.com>
Message-Id: <174715754665.2956902.2975390357687091915.robh@kernel.org>
Subject: Re: [PATCH v3 6/7] dt-bindings: rtc-rv8803: add tamper detection
 property node


On Tue, 13 May 2025 18:19:21 +0200, Markus Burri wrote:
> Document tamper detection property for epson,rx8901 rtc chip.
> 
> Signed-off-by: Markus Burri <markus.burri@mt.com>
> ---
>  .../devicetree/bindings/rtc/epson,rx8900.yaml | 40 +++++++++++++++++--
>  1 file changed, 37 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml: buffer-mode: missing type definition

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250513161922.4064-7-markus.burri@mt.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


