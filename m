Return-Path: <linux-rtc+bounces-6169-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKjTN2fKsWnvFAAAu9opvQ
	(envelope-from <linux-rtc+bounces-6169-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Mar 2026 21:02:47 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 194C9269C0E
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Mar 2026 21:02:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 108D53028E9E
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Mar 2026 20:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CC12383C74;
	Wed, 11 Mar 2026 20:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="q+nQURgb"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9193382F21;
	Wed, 11 Mar 2026 20:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773259364; cv=none; b=GgoSM1YcN1m0r3hAm3BLjR0GAHeXRsxZIgh4rAuR7JpPl+OnxKBFwtkrZQ3wANVMAF+N0MomOEytOJGbbpm7PbGBf37zud2QNFjnzXa/aZTxSg9LKJ+tI+IH6mB7KOMcbTDs96kx6pRgWSiml8FRfLf+bgn1XcsrsNEovLj9jsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773259364; c=relaxed/simple;
	bh=HD9HTzNjwK6ZrKrOXdJtukGIIMH7OcqdIPgg+tRIy+U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XrbmdpueqsqfIKxERMrJiuGPT0C28iGqjsdItMdr19hqEEE8aLPBlhsEO+Qs36LedKaSLwv5KIKoxlUM4Aw3UccZSrTmM6dFV5JXty5xDXZjAx72hoDT7VkBb8WQ2QQRDo0T1iScprtR/CVOzSnMfJPgvzWrq3F7Mm0GLUxuowM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=fail (0-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=q+nQURgb reason="key not found in DNS"; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject
	:Cc:To:From:subject:date:message-id:reply-to;
	bh=P/6vJCNLlu/g15Z8iXznmpp40k1UW735k4JQ6MwS6ao=; b=q+nQURgbcv0o8MM35wm0ip5kCq
	1Vt0JdFwIekSato17G0G6KB9rNcVN1MOw2En09ZkT6IG/yPVjWs9FXBwdSvEtjFbcJxARSEwkbxdX
	7szMw13ouj476SsSH76++UD26INc0cahEx0VAVshy1UpGaVTrZbdFXilSAWcL8G4rO2E=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168] helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.98.2)
	(envelope-from <hugo@hugovil.com>)
	id 1w0PlP-000000000Lu-3dih;
	Wed, 11 Mar 2026 16:02:40 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hugo@hugovil.com,
	bruno.thomsen@gmail.com,
	giampiero@sferalabs.cc,
	p.rosenberger@kunbus.com,
	antonio@amsobr.com,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH 0/4] rtc: pcf2127: add support for battery low voltage detection
Date: Wed, 11 Mar 2026 16:02:26 -0400
Message-ID: <20260311200237.3531981-1-hugo@hugovil.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam_score: -1.0
X-Spam_bar: -
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6169-lists,linux-rtc=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[hugovil.com];
	R_DKIM_PERMFAIL(0.00)[hugovil.com:s=default];
	FREEMAIL_CC(0.00)[vger.kernel.org,hugovil.com,gmail.com,sferalabs.cc,kunbus.com,amsobr.com,dimonoff.com];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hugo@hugovil.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[hugovil.com:~];
	NEURAL_HAM(-0.00)[-0.487];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,dimonoff.com:email]
X-Rspamd-Queue-Id: 194C9269C0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Hello,
this patch series adds support for battery low voltage detection configuration
for RTC devicesm, with specifc changes targeted at the pcf2127/2131 devices.

The origin of this patch goes back to the initial commit to add support for the
PCF2131 device. On the PCF2131, the battery low voltage detection is disabled by
default at the hardware level, contrary to the PCF2127 where it is enabled by
default. Because of that, a lot of people are stuck with a PCF2131 RTC device
using a battery backup, but unable to use it!

A lot of people are writing to me in private emails to report this as a bug
in the PCF2131 driver. Others (and me) have proposed to implement device tree
properties to enable these functions, but this was rejected [1][2][3].

It is important to note that some projects do not have the luxury to modify
the bootloder to enable that function at boot, and for these having a DT
property that could be put in a DT overlay would simplify a lot their life.
Also having to rely on a userspace application to configure the RTC is also
not ideal, as some projects use stock Debian distros (for example), and
adding a new application to their repository is not trivial or easy.

So as the next best thing, this patch aims to add what is missing in the driver,
the ability to enable/disable the battery low voltage detection with ioctls,
similarly to what is done with the BSM.

This patch has been tested on a custom board with a PCF2131 and using my
userspace application:

    git clone -b batlow_param git@git.hugovil.com:repos/hvrtc.git

Thank you.

Link: https://lore.kernel.org/linux-rtc/20190910143945.9364-1-bruno.thomsen@gmail.com/ [1]
Link: https://lore.kernel.org/linux-rtc/20191211163354.GC1463890@piout.net/ [2]
Link: https://lore.kernel.org/linux-rtc/20230123170731.6064430c50f5fb7b484d8734@hugovil.com/ [3]

Hugo Villeneuve (4):
  rtc: pcf2127: remove redundant break statement in switch-case
  rtc: pcf2127: add pcf2127_pwrmng_get/set
  rtc: add battery low voltage detection feature
  rtc: pcf2127: support battery low voltage detection function

 drivers/rtc/rtc-pcf2127.c | 94 ++++++++++++++++++++++++++++++---------
 include/uapi/linux/rtc.h  |  7 ++-
 2 files changed, 80 insertions(+), 21 deletions(-)


base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
-- 
2.47.3


