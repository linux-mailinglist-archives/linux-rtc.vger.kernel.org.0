Return-Path: <linux-rtc+bounces-5798-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKylJ6DQb2mgMQAAu9opvQ
	(envelope-from <linux-rtc+bounces-5798-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Jan 2026 19:59:44 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4655C49EDB
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Jan 2026 19:59:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A1187807D65
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Jan 2026 16:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9DCF45348A;
	Tue, 20 Jan 2026 15:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N6+yjN9b"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA23421F1B;
	Tue, 20 Jan 2026 15:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768924160; cv=none; b=TjFN3O9Urui6Tsc+bDQbTyESwKuaB+bHrLBVDlpSTg8Nmhu+UWmr9xQhY9lpy0k4+u+l8beCEa1xxMNM0qKwwst2XIR3rk1eX+Yrjm4nc3u4iaHsUaYuwZ1DIgk7IJbhTI8qGQVS0uiF3opnx9o3f08KEdV052UIlcAWeUgQIhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768924160; c=relaxed/simple;
	bh=OPI6ghDvXB3e93oflA9SE1Ayg+e7PVULHaN+x6M5oac=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=j7qhHcFa3+G8G2ioVbeipThx3yQv7ePG5WnFjKur++q1C5xC4Y5K8jOpGjQ++NxjgakwBuyS0O9MCCVjOz1bfDzAJRfc3nOYx++664Pq9ogznUdeJmo6QzkYs7LkzNXIevlM+cXfhGnkQws/aUJIgBXBBJNtdup+RHPqhRkcQa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N6+yjN9b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34D6EC16AAE;
	Tue, 20 Jan 2026 15:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768924160;
	bh=OPI6ghDvXB3e93oflA9SE1Ayg+e7PVULHaN+x6M5oac=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=N6+yjN9b2Azw5n9SKjthyvXJx48FnozW8j7baHr3CKCynegZsx/sSCyE0LPTU5qFe
	 lTitjfHFnLKHEnwP1O82TYOYIt0H7wX3qBBJtvfOtpjR7TQaHt67ZMbQQ4BmVEo8wr
	 8Mim4Ym+bV6RtrgcqRvomGGnbDaQbtdVXVramgMgDk13lk5tPO0Q0mgbQQshqMinNs
	 Wqkcz2rdS/TheLgBQbLMMXgOurIuA21Py2O5ySO5z52NmDoyBR8dwEQ8ZjAs7Khyuh
	 Xveap9YDsikEU1Ttes8yCok6HkTjJ9goitT/iHqWV+Ufz6BHcQGa59eSW7npThXvCN
	 uqJqRBp+lk+dg==
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 Douglas Anderson <dianders@chromium.org>, kernel-team@android.com, 
 Kaustabh Chakraborty <kauschluss@disroot.org>, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org
In-Reply-To: <20251120-s5m-alarm-v2-0-cc15f0e32161@linaro.org>
References: <20251120-s5m-alarm-v2-0-cc15f0e32161@linaro.org>
Subject: Re: [PATCH v2 0/3] Samsung mfd/rtc driver alarm IRQ simplification
Message-Id: <176892415694.2292562.7457528145774108517.b4-ty@kernel.org>
Date: Tue, 20 Jan 2026 15:49:16 +0000
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-5798-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 4655C49EDB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 20 Nov 2025 14:38:03 +0000, André Draszik wrote:
> With the attached patches the Samsung s5m RTC driver is simplified a
> little bit with regards to alarm IRQ acquisition.
> 
> The end result is that instead of having a list of IRQ numbers for each
> variant (and a BUILD_BUG_ON() to ensure consistency), the RTC driver
> queries the 'alarm' platform resource from the parent (mfd cell).
> 
> [...]

Applied, thanks!

[1/3] mfd: sec: add rtc alarm IRQ as platform device resource
      (no commit info)
[2/3] rtc: s5m: query platform device IRQ resource for alarm IRQ
      commit: c70aee3dd85482c67720eb642d59ebbb9433faa5
[3/3] mfd: sec: drop now unused struct sec_pmic_dev::irq_data
      (no commit info)

--
Lee Jones [李琼斯]


