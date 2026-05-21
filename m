Return-Path: <linux-rtc+bounces-6563-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMJgJCmWD2qtNgYAu9opvQ
	(envelope-from <linux-rtc+bounces-6563-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 22 May 2026 01:32:57 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC695ACCA6
	for <lists+linux-rtc@lfdr.de>; Fri, 22 May 2026 01:32:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 855AF300D74F
	for <lists+linux-rtc@lfdr.de>; Thu, 21 May 2026 23:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC69D35E1CF;
	Thu, 21 May 2026 23:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h/LbJ0r2"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0AA3546E7;
	Thu, 21 May 2026 23:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779406324; cv=none; b=AHJEPWloB/02M43ytwmchcvsNlrWwfNM1znW3g88tos90L2OXVzZPybMQWUnIob82/Pd4UtjhEPLDUCy8JvQO+u4nb6+u4jAEhGCtPmMtNeIimPW8U9ewyH+TUkL71nlpJo1DBiTHXT+HQJ3enoAp9HO75EycPh55MlpwqGnn0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779406324; c=relaxed/simple;
	bh=7TmaIO5oduK2azyfJDdjVJpI1MH2UNG4NTpL5+JHNHo=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=MuVyq3epepUezgbrD55F9JCNkrBzrLH9rJBM0yxpnbf4/A8c9E3ifVJZhDLZwEgSQrelKfr3iRS3Q0fiVA6j0UDgnhHRbQV1EdsoTcFAnscpZqdYmrWCJ4n7Q902jKuw09qsXe5fLnNn0Tr9Kj+dkwH09j08GeKcvYv9wVrfh20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h/LbJ0r2; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 287C21F000E9;
	Thu, 21 May 2026 23:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779406323;
	bh=4KDePbDGjZz/sPL3T4ikV+N9NlVs33GvN/RGqbtG0SM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=h/LbJ0r2YMXjw0TEF60G9otoPAojvg5S5qnBST80pGceJ8zD9z52vawqx4WvGIJg+
	 2xjxSk0YzzeT2CG5TZVmE/LHgmN2rxLLawDXEShZs1wuZyG//VIz75FRess/488Ia0
	 srUAxqhfg/B//StjP/kB50gQoFfTjF7McNCCV4F8UKpg149UVSna44AOtqlaDnrxig
	 5ROrTDEiSGwcUUZOVFtL0Kcu+dAFT222KXG9GMN7BeH8COf2wkAwGhbT4QPWbaOFX2
	 /gv19XYuaWS5oXRBNIttUkPiCEdMhJDwJXIN/lG/bVMYYKMRe3CY82leNZZarfMA1X
	 xchGggCFpgCqA==
Date: Thu, 21 May 2026 18:32:02 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-rtc@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, 
 mturquette@baylibre.com, skhan@linuxfoundation.org, me@brighamcampbell.com, 
 linux-kernel@vger.kernel.org, sboyd@kernel.org, devicetree@vger.kernel.org
To: Udaya Kiran Challa <challauday369@gmail.com>
In-Reply-To: <20260521170810.19702-1-challauday369@gmail.com>
References: <20260521170810.19702-1-challauday369@gmail.com>
Message-Id: <177940632246.2472848.11417578144916287580.robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: clock: via,vt8500: Convert to DT
 Schema
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6563-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 2FC695ACCA6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 21 May 2026 22:37:28 +0530, Udaya Kiran Challa wrote:
> Convert the VIA/Wondermedia VT8500 and Wondermedia WM8xxx series SoCs clock
> controller binding from the legacy text format to DT schema.
> 
> Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
> ---
> Changelog:
> Changes since v1:
> - Add default value for divisor-mask
> - Add required properties compatible and model
> - Fix example node name
> - Update example size cells and reg value
> 
> Link to v1:https://lore.kernel.org/all/20260520025131.17772-1-challauday369@gmail.com/
> ---
>  .../bindings/clock/via,vt8500-clock.yaml      | 126 ++++++++++++++++++
>  .../devicetree/bindings/clock/vt8500.txt      |  74 ----------
>  2 files changed, 126 insertions(+), 74 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/via,vt8500-clock.yaml
>  delete mode 100644 Documentation/devicetree/bindings/clock/vt8500.txt
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/clock/via,vt8500-clock.example.dtb: /: failed to match any schema with compatible: ['via,wm8650']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260521170810.19702-1-challauday369@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


