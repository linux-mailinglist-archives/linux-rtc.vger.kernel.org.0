Return-Path: <linux-rtc+bounces-5799-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AczNn7Hb2mgMQAAu9opvQ
	(envelope-from <linux-rtc+bounces-5799-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Jan 2026 19:20:46 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9014957A
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Jan 2026 19:20:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4AC3A80873C
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Jan 2026 16:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02D6545BD6E;
	Tue, 20 Jan 2026 15:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CNEDYp41"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD29245BD68;
	Tue, 20 Jan 2026 15:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768924163; cv=none; b=X/HEb7/+sf/2sb15Blbon3uvmZoFRBYN8GI8PDbD9YAS4D01B4j0WDfAGwiAgF8Af8l3mQiMuadzWUN+rTEfIu3xT1GKoe0ubgblUXgXqAUeEAVPtfAZn94WBF27GtdPsFE5u6YRhHZ3742tgp8MMX+0XnrtMmssKHerWknXRa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768924163; c=relaxed/simple;
	bh=iLUh0Hl0COXl6Tfg6wZzxW6FKe0r5kGKRlC7OUwcb5o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QH6qNC/4mqEgOyQgYnKWgCeOwCCsg9636Jbi2/4NXsqNarc8rpRQtG4/ImDCzjlG25w221QfcA8pXIu/xe/TrvzmcfD0MhupuHbsukmOfebx0axkp3+O0yUUeLysU6hJSlT/w8c7Lf/VhUHgDWoPcx/eJzOlg8mP5dGeVboGods=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CNEDYp41; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7237EC19424;
	Tue, 20 Jan 2026 15:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768924163;
	bh=iLUh0Hl0COXl6Tfg6wZzxW6FKe0r5kGKRlC7OUwcb5o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CNEDYp41qDPWpSeb5DjAuo/OhEQ/oOYtNEEPlx3qHOLNa6aEreOc1O/JjaPPtFE2v
	 7gsq/pYEJbV6tp9GW6Dy4E0UxPnWCSgd9S1yIcQk7bt2a/18W8vcKZbS/waDi9thEK
	 w6zkC5rU0mK5BB8in8tnJwooqI1m8g2pzHz11k23QZIA5As2dg/bzRXmCxt5IqkwTp
	 oahRjdMjjGDFtZlX6caWlFxfD5zG/uR7HpfkQRPrBzKxbW8btYlgNhq1cKFX+s69rM
	 XbVN6DjomL8gJXRZZw7TEXFRpr82CqItqysxLqXb2kgedtOV2uLGgYJ6ivgHpe3eWz
	 VxIVbbfKuVAig==
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
In-Reply-To: <20260113-s5m-alarm-v3-0-855a19db1277@linaro.org>
References: <20260113-s5m-alarm-v3-0-855a19db1277@linaro.org>
Subject: Re: [PATCH v3 0/3] Samsung mfd/rtc driver alarm IRQ simplification
Message-Id: <176892416020.2292562.12972171855041051987.b4-ty@kernel.org>
Date: Tue, 20 Jan 2026 15:49:20 +0000
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
	TAGGED_FROM(0.00)[bounces-5799-lists,linux-rtc=lfdr.de];
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
X-Rspamd-Queue-Id: AD9014957A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 13 Jan 2026 14:03:10 +0000, André Draszik wrote:
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
      commit: 153ae5c52b7063ac0926926d0cc9b53ee9d7fed2
[2/3] rtc: s5m: query platform device IRQ resource for alarm IRQ
      commit: c70aee3dd85482c67720eb642d59ebbb9433faa5
[3/3] mfd: sec: drop now unused struct sec_pmic_dev::irq_data
      commit: b31583a1a9ab32923734ceb5fc95e536dfacccf7

--
Lee Jones [李琼斯]


