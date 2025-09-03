Return-Path: <linux-rtc+bounces-4819-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 67056B42B02
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Sep 2025 22:33:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED0B520768A
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Sep 2025 20:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDA842DECBF;
	Wed,  3 Sep 2025 20:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NlwZDffg"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B180C2D7DDC;
	Wed,  3 Sep 2025 20:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756931591; cv=none; b=A4gBlZEKseKeweH6m+k6jNYKkpA20ZLv9HIPvq6ew9Od2QU/CBLERdctAJneM1JZksBUtdaVsilHgb1FwV20ssnew4B0LQtB4v+Y8cxdWtKqIIoch7uZQEg7DdqP6c789nwJ3IcXp+nILbHSBxZMgc1Kaqy4pibw0PKbGJPcfjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756931591; c=relaxed/simple;
	bh=2f9tKcsMKp0gciepEFUNwE/NuRRBuswExnDtz+quojg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=lV1ncaO34bf3xV3zkZRCS1gDDFnp2h8Laa30ljI9z4upKF3JAPK856WSGTq1+aoiANyerrPBuKDC4Fe1LvW4OqnUyeAjohsTDuulegmirL76FqRl6mzcniZuTR9rTRepYyrdkhM6pzNmDoXjvxP7ea3F7vV1kRGo6DftcnBCm1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NlwZDffg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1209AC4CEE7;
	Wed,  3 Sep 2025 20:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756931591;
	bh=2f9tKcsMKp0gciepEFUNwE/NuRRBuswExnDtz+quojg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=NlwZDffgn/uyHsx5R1Rd/uEKJO8qLBGp591R06JNfPTd0e8mVkrkT7z8nyW7UMYaE
	 lg15pZ72vnzJYHpKarZj5foxwoWAHHQz//yQVqyxRip8reHw9g9PqqkGMMb2/CsMnj
	 TU8Y/gBqM5dCp16QwMgULs9umMoSoT/y+X3gG32jf7jBhpVoNOb2xwVq9Rl9L4soVB
	 FQwHMLNWj62RxkFAMfmmVKKw3xJpX4mgIt9J2TD4K3iOn1vDMgSVbOYBn/+dhGjZA2
	 1X5cBZO4EobCjEpxQiZlnJqEeqZZmkkxh4Tc7Z30omCVVUwP6Vv0pHWr15z0xho945
	 2/FgB5pHH39ww==
Date: Wed, 03 Sep 2025 15:33:09 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: conor+dt@kernel.org, akhileshpatilvnit@gmail.com, 
 alexandre.belloni@bootlin.com, devicetree@vger.kernel.org, 
 skhan@linuxfoundation.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, krzk+dt@kernel.org
To: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
In-Reply-To: <40c91cbb07140ecdf4f91afc118c2518e85041c3.1756908788.git.akhilesh@ee.iitb.ac.in>
References: <cover.1756908788.git.akhilesh@ee.iitb.ac.in>
 <40c91cbb07140ecdf4f91afc118c2518e85041c3.1756908788.git.akhilesh@ee.iitb.ac.in>
Message-Id: <175693109106.2632657.7210111562609341656.robh@kernel.org>
Subject: Re: [PATCH 2/7] dt-bindings: rtc: add bindings for m41t93


On Wed, 03 Sep 2025 19:55:59 +0530, Akhilesh Patil wrote:
> add DT bindings for m41t93 rtc in YAML format.
> 
> Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
> ---
>  .../devicetree/bindings/rtc/st,m41t93.yaml    | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/st,m41t93.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/rtc/st,m41t93.example.dtb: rtc@0 (st,m41t93): Unevaluated properties are not allowed ('spi-max-frequency' was unexpected)
	from schema $id: http://devicetree.org/schemas/rtc/st,m41t93.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/40c91cbb07140ecdf4f91afc118c2518e85041c3.1756908788.git.akhilesh@ee.iitb.ac.in

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


