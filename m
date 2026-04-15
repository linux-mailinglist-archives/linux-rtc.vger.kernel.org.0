Return-Path: <linux-rtc+bounces-6336-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDGEOsM732kLQwAAu9opvQ
	(envelope-from <linux-rtc+bounces-6336-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 15 Apr 2026 09:18:27 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 95034401498
	for <lists+linux-rtc@lfdr.de>; Wed, 15 Apr 2026 09:18:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CB9073031B4E
	for <lists+linux-rtc@lfdr.de>; Wed, 15 Apr 2026 07:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED0BF3A3E76;
	Wed, 15 Apr 2026 07:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GPrK9zRx"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84B439A7E1;
	Wed, 15 Apr 2026 07:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776237501; cv=none; b=br7Vbj3GWMnnZMf94kgblsMzYPNzl7FGaX2cXyaSJ+4u1vWQBbZUJFB/ev9L1KIGfzKipZQeTOhou4zNDHfC0mSecrUF/PCA9au9ox7zVvnyjO++/d+CVoUpnD38iQd9cz2LmZn68tGLWqS+FzWIa2CvbZtGLfC7Om19ac9fKQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776237501; c=relaxed/simple;
	bh=QCKrkPf03ChOxKQ5AtqRnMNpAAHo6qRr84XRMqp9+jI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hP6iSFCipn5yFDQEHGLh3z7rLor5Ro8NAo50wAFGDXjsaW+/gBVdbQOBEy5SKnIYZOtAg9/mHY8OZvaofxFSzkXCbu8cQ703OQzwYXo8fSk3cCRoBPdXc7znWInRPGS+Q/2tvIgv59koPqTEP7RdYVgrq2rL35sge5BLEqkVw+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GPrK9zRx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13CE5C2BCB0;
	Wed, 15 Apr 2026 07:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776237501;
	bh=QCKrkPf03ChOxKQ5AtqRnMNpAAHo6qRr84XRMqp9+jI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GPrK9zRxYJtu4WlDxyoyuUA0dAuxfn3Yzvq2bLgz3lIz2uK5ktDv35XvH2FQsgsBf
	 7oJzkVxrCpnIsbydA4E5Z9I3jZZKndIavoNsoArMD5oDipiiDqUrikDboBCimG0sD5
	 m2b4Sx2bxiQATVgBOZ5NOqJYMwHm5wh0PEj6eemOs/2nlqbwMLHUvHnZVzX3UrdzXi
	 H+m+YDtBGiN7LFdsobBFtNjRvQb/xryS5Np1smsmpwrcJUnO40R2wtFwhQLKA+2XVu
	 XeI/zPCM2Lj1jLU3TeY0pWn6Vvv5JglKGoLAJhhBTUjKDvqnKo5Vw6QlB4ML4hYRdy
	 cjrp2nEraP0Sw==
Date: Wed, 15 Apr 2026 09:18:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Sebastian Reichel <sre@kernel.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Nam Tran <trannamatk@gmail.com>, =?utf-8?B?xYF1a2FzeiBMZWJpZWR6acWEc2tp?= <kernel@lvkasz.us>, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 04/13] dt-bindings: power: supply: document Samsung
 S2M series PMIC charger device
Message-ID: <20260415-swinging-radical-junglefowl-85dcf7@quoll>
References: <20260414-s2mu005-pmic-v4-0-7fe7480577e6@disroot.org>
 <20260414-s2mu005-pmic-v4-4-7fe7480577e6@disroot.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260414-s2mu005-pmic-v4-4-7fe7480577e6@disroot.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6336-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,samsung.com,linaro.org,bootlin.com,lwn.net,linuxfoundation.org,gmail.com,lvkasz.us,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 95034401498
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 12:02:56PM +0530, Kaustabh Chakraborty wrote:
> +description: |
> +  The Samsung S2M series PMIC battery charger manages power interfacing
> +  of the USB port. It may supply power, as done in USB OTG operation
> +  mode, or it may accept power and redirect it to the battery fuelgauge
> +  for charging.
> +
> +  This is a part of device tree bindings for S2M and S5M family of Power
> +  Management IC (PMIC).
> +
> +  See also Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml for
> +  additional information and example.
> +
> +allOf:
> +  - $ref: power-supply.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - samsung,s2mu005-charger
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port

That port is internal part of the device, thus should be dropped which
leaves you with only one property - monitored battery - and therefore
fold the node into the parent node.

Best regards,
Krzysztof


