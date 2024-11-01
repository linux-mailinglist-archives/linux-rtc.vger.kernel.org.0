Return-Path: <linux-rtc+bounces-2412-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD1B9B890D
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Nov 2024 03:07:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECE141C213DA
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Nov 2024 02:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D16E113B7AF;
	Fri,  1 Nov 2024 02:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fUg32nlV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CA613A3F3;
	Fri,  1 Nov 2024 02:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730426819; cv=none; b=BbRQZ+ZOA1W/0g9PSmeDrx67udsefC97Yywp2C3FVbEV7IOVW38/48KS8W1OkXwwNrh/hNb/ABOu57HpzoTkhyFKGytuLNFUjAGwlBOKWiUdTOEFJSVUAyVG61IOKrM21qb0k4atxAFV0qJmBk3VthGPBKlLYNRuJUu7oRFgGwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730426819; c=relaxed/simple;
	bh=a/hFCgDZqsbnUBYLjL3wvxEJ7t4hBd6dwDs0Oy9yB58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iu1a2zjQJsRkkkIW0Vm1q//kOjAIUvMv/quiDwJWx84oLRynbjwfzNb1PHAdyFSfN48Das9pZ7pCuSh91HWq6n6wa9umxqiYZVIeuqelZf9Lbzuf6k234lN/DKQwxDBRXHLr4XyvnZv8YNDLVAm/GO9bbaZPfZLWHibSpIRNdPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fUg32nlV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D4CBC4CED7;
	Fri,  1 Nov 2024 02:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730426819;
	bh=a/hFCgDZqsbnUBYLjL3wvxEJ7t4hBd6dwDs0Oy9yB58=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fUg32nlVkfFHvxMTs/wTO79y1W3ZgfW5c2+DBISY/VyM/SoS+bCeVXDu7LEkSlj26
	 ZWLZORcBXV6TzkHiS7Vzh0Jvlm5Dhqu9LWZwD+KXYF1f1xBzJU12reP6Y4sloUVhgT
	 QUuwnxYVb3qaNi4db3osbnLiyVocIYEDz819F7vvv87F1CWD4fNJwrEw0xbzaV+XXB
	 BTA0Sl62SWuCdU+kvNocl3P8xnr+L3GDqsdcIYHMRauW2d6exdOupY3XWh+MB8DXpH
	 LPFTeAN6aMPdt9OLnPwwGi18XfWeD+tdlQNBlEe5yXgMpYE803uISxMmwR0L0kP28B
	 giE5LSG3usvxQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45DD7E67498;
	Fri,  1 Nov 2024 02:06:59 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 01 Nov 2024 10:06:49 +0800
Subject: [PATCH RESEND v4 3/3] MAINTAINERS: Add an entry for Amlogic RTC
 driver
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-rtc-v4-3-14e1ed486ed8@amlogic.com>
References: <20241101-rtc-v4-0-14e1ed486ed8@amlogic.com>
In-Reply-To: <20241101-rtc-v4-0-14e1ed486ed8@amlogic.com>
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730426817; l=931;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=dltl4Bg5cOWUNAG/8WRhVbXcztZ3rrpVcPR+gcSx/Bg=;
 b=HzHLxTTw3Lvqis+Z3qX6pmogtTEP9P67Vk8W6UTuNcUXd4MPJzBuKmmzn7hAnoT3wuiKDrJzW
 ziXW2peqiFCAlmF8lRtOzry7v2EWMaUDThQBl64psRiYIiXIkr+HV5C
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Yiting Deng <yiting.deng@amlogic.com>

Add Amlogic RTC entry to MAINTAINERS to clarify the maintainers.

Signed-off-by: Yiting Deng <yiting.deng@amlogic.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 42decde38320..f595715eb3e3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1163,6 +1163,14 @@ F:	Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
 F:	drivers/perf/amlogic/
 F:	include/soc/amlogic/
 
+AMLOGIC RTC DRIVER
+M:	Yiting Deng <yiting.deng@amlogic.com>
+M:	Xianwei Zhao <xianwei.zhao@amlogic.com>
+L:	linux-amlogic@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/rtc/amlogic,a4-rtc.yaml
+F:	drivers/rtc/rtc-amlogic-a4.c
+
 AMPHENOL CHIPCAP 2 HUMIDITY-TEMPERATURE IIO DRIVER
 M:	Javier Carrasco <javier.carrasco.cruz@gmail.com>
 L:	linux-hwmon@vger.kernel.org

-- 
2.37.1



