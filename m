Return-Path: <linux-rtc+bounces-4076-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C308BAB1A03
	for <lists+linux-rtc@lfdr.de>; Fri,  9 May 2025 18:13:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE7E93A323B
	for <lists+linux-rtc@lfdr.de>; Fri,  9 May 2025 16:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B06D23504C;
	Fri,  9 May 2025 16:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KBrXl4MH"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDD42356A9;
	Fri,  9 May 2025 16:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746806922; cv=none; b=QYv7wGyH7m8ACgQ/YDq0iuOa4JGkbNverwnIJ39+WtFN6ShEA6K3vffPKQ6A+5IJBcmyeCF7OcOAbMzZZeoe2RRLtCdxzBwgPDh/gRAVIKsgmCahw6P8jUTMHeibsKzuongRjsitWZqEQmxbhjoEGe0glfWjY4apHq9Y9wkSc1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746806922; c=relaxed/simple;
	bh=Y/pwIYQ7Gvkoj4IE27qFKAazwu34nAkHNTKwiqwd7iI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NMjH5/Mr8IC4XQEsrXXbmNX/cuL4ui76tS5RvLRRkvc7KV7QnSc3w2wHfn2BwDIE6Y7nL9X9Ypp/yLRwh/9HX0HqZkcrKn+bVikKdYndW/yCNmGjjw08JxqtlqGN5tBt1/YEjCs9By1QcTq2/WZg7vbhFrn9MLcyIPQOqatqOE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KBrXl4MH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549Brwcm008543;
	Fri, 9 May 2025 16:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RgVhBK4rL51OIXUQVnrhKnCX4dAK5HxRcD9ls+aPKuw=; b=KBrXl4MHG1A7qMSH
	DAoViBNFmm6BniZOAkawtHkjT62vGqcn3i5t0fDaYMosMEETyyx+PZ45lS7PewDX
	YazudzdGIn+6K0OxY4Q2XuqSY6wsCUJyr0Tfdam9Chs6d+7E4MR0+deNtIULEPnF
	IyU+cod8kDswrPwMiuJSxBHan4SnzNWLzjZV0avanH63ZnpS4zudkOK+xgzLz2KM
	uQtnK/07I9huKYtuzsz/HkhJ/v92pV+LNpMfOmX40Bi1LvhesOKbqQpbm46oa4WG
	jUcou0+rjJZDDKPxXTeFfZFKLS/P7mFbfb0J5OI7rWSpAfyrL44RLA9mbHzFD3s3
	5GTUPQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp5d776-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 16:08:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 549G84i8028927
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 16:08:04 GMT
Received: from PHILBER.na.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 9 May 2025 09:07:58 -0700
From: Peter Hilber <quic_philber@quicinc.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
CC: Trilok Soni <quic_tsoni@quicinc.com>,
        Peter Hilber
	<quic_philber@quicinc.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
        Richard Cochran
	<richardcochran@gmail.com>,
        <linux-kernel@vger.kernel.org>, <virtualization@lists.linux.dev>,
        <netdev@vger.kernel.org>, David Woodhouse
	<dwmw2@infradead.org>,
        "Ridoux, Julien" <ridouxj@amazon.com>, Marc Zyngier
	<maz@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Lezcano
	<daniel.lezcano@linaro.org>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>,
        Parav Pandit <parav@nvidia.com>,
        "Matias
 Ezequiel Vara Larsen" <mvaralar@redhat.com>,
        Cornelia Huck
	<cohuck@redhat.com>, Simon Horman <horms@kernel.org>,
        <virtio-dev@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
        <linux-rtc@vger.kernel.org>
Subject: [PATCH v7 1/4] virtio_rtc: Add module and driver core
Date: Fri, 9 May 2025 18:07:22 +0200
Message-ID: <20250509160734.1772-2-quic_philber@quicinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250509160734.1772-1-quic_philber@quicinc.com>
References: <20250509160734.1772-1-quic_philber@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Lu2Symdc c=1 sm=1 tr=0 ts=681e2865 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=bs-e4Z8cAAAA:8
 a=20KFwNOVAAAA:8 a=dsUN5IrYLHpEE-TGldIA:9 a=TjNXssC_j7lpFel5tvFf:22
 a=YFpLQiK6rFjqGb8m0bXF:22
X-Proofpoint-GUID: Huc3-JNtTAj3Ud8BCNcL8skMeYSjn31N
X-Proofpoint-ORIG-GUID: Huc3-JNtTAj3Ud8BCNcL8skMeYSjn31N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDE1OSBTYWx0ZWRfX7sdfoH6QV8r9
 8bUcxjWQ+ExGL3HBkw65YxDWiBZGyBu4/6Wp+qKRLgBjqPjRV37V8cgf+RjFwqM642CkzaMI9/G
 pcrAfvLZNlcNNSWHYc58zHNhVv8ENK4O3dj0sNJdu1HZbvwqwP/SMEDiHUKNjCg6DCDvSqApLMz
 /LSlt4mfLDSMdywjRyn7OI036TJ4Wh570soOmIYQMo1Q507DFh98qJRGYaVhmQksZnADDQKMhSk
 jJR6iUsog436Sqyu7/CrJn/RQ34HUYf+Xo9VCwN8AbgGUuzpF5SvYX/oslrX2YHbJTACcwi4llS
 Grl5FuOosCYZ1YelN2cwBt4t2CnQ5vmotfaTmKTdvqvVt14AE0ZpKx9D2mrjmlsOmsJQACt4UTw
 BTjC/mLPgaBez+cwvqgkbzFPPMnnobn6aC0Qwrxyn8dq3s76UHZluv9aMTiMkeKL27YkJym+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 clxscore=1011 adultscore=0 malwarescore=0
 spamscore=0 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090159

Add the virtio_rtc module and driver core. The virtio_rtc module implements
a driver compatible with the proposed Virtio RTC device specification.
The Virtio RTC (Real Time Clock) device provides information about current
time. The device can provide different clocks, e.g. for the UTC or TAI time
standards, or for physical time elapsed since some past epoch. The driver
can read the clocks with simple or more accurate methods.

Implement the core, which interacts with the Virtio RTC device. Apart from
this, the core does not expose functionality outside of the virtio_rtc
module. Follow-up patches will expose PTP clocks and an RTC Class device.

Provide synchronous messaging, which is enough for the expected time
synchronization use cases through PTP clocks (similar to ptp_kvm) or RTC
Class device.

Signed-off-by: Peter Hilber <quic_philber@quicinc.com>
---

Notes:
    v6:
    
    - Fix sparse warning about endianness mismatch (Simon Horman).
    
    - Improve error status computation readability.
    
    v5:
    
    - Remove definitions dropped in virtio-rtc spec v7.
    
    - Fix style issues.
    
    - Add freeze/restore ops already in this patch.
    
    - Drop unnecessary memory barrier pair.
    
    - Return error status from device, whenever available.
    
    - Use secs_to_jiffies() macro.
    
    v4:
    
    - Update Virtio interface to spec v6.
    
    - Distinguish UTC-like clocks by handling of leap seconds (spec v6).
    
    - Remove unnecessary memory barriers.
    
    - Cosmetic improvements.
    
    v3:
    
    - merge readq and controlq into a single requestq (spec v3)
    
    - don't guard cross-timestamping with feature bit (spec v3)
    
    - pad message headers to 64 bits (spec v3)
    
    - reduce clock id to 16 bits (spec v3)
    
    - change Virtio status codes (spec v3)
    
    - use 'VIRTIO_RTC_REQ_' prefix for request messages (spec v3)

 MAINTAINERS                          |   7 +
 drivers/virtio/Kconfig               |  13 +
 drivers/virtio/Makefile              |   2 +
 drivers/virtio/virtio_rtc_driver.c   | 786 +++++++++++++++++++++++++++
 drivers/virtio/virtio_rtc_internal.h |  24 +
 include/uapi/linux/virtio_rtc.h      | 151 +++++
 6 files changed, 983 insertions(+)
 create mode 100644 drivers/virtio/virtio_rtc_driver.c
 create mode 100644 drivers/virtio/virtio_rtc_internal.h
 create mode 100644 include/uapi/linux/virtio_rtc.h

diff --git a/MAINTAINERS b/MAINTAINERS
index c59316109e3f..f5b06737c5cd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25658,6 +25658,13 @@ S:	Maintained
 F:	drivers/nvdimm/nd_virtio.c
 F:	drivers/nvdimm/virtio_pmem.c
 
+VIRTIO RTC DRIVER
+M:	Peter Hilber <quic_philber@quicinc.com>
+L:	virtualization@lists.linux.dev
+S:	Maintained
+F:	drivers/virtio/virtio_rtc_*
+F:	include/uapi/linux/virtio_rtc.h
+
 VIRTIO SOUND DRIVER
 M:	Anton Yakovlev <anton.yakovlev@opensynergy.com>
 M:	"Michael S. Tsirkin" <mst@redhat.com>
diff --git a/drivers/virtio/Kconfig b/drivers/virtio/Kconfig
index 2eb747311bfd..83bcb06acb6c 100644
--- a/drivers/virtio/Kconfig
+++ b/drivers/virtio/Kconfig
@@ -188,4 +188,17 @@ config VIRTIO_DEBUG
 
 	  If unsure, say N.
 
+config VIRTIO_RTC
+	tristate "Virtio RTC driver"
+	depends on VIRTIO
+	depends on PTP_1588_CLOCK_OPTIONAL
+	help
+	 This driver provides current time from a Virtio RTC device. The driver
+	 provides the time through one or more clocks.
+
+	 To compile this code as a module, choose M here: the module will be
+	 called virtio_rtc.
+
+	 If unsure, say M.
+
 endif # VIRTIO_MENU
diff --git a/drivers/virtio/Makefile b/drivers/virtio/Makefile
index 58b2b0489fc9..c41c4c0f9264 100644
--- a/drivers/virtio/Makefile
+++ b/drivers/virtio/Makefile
@@ -14,3 +14,5 @@ obj-$(CONFIG_VIRTIO_VDPA) += virtio_vdpa.o
 obj-$(CONFIG_VIRTIO_MEM) += virtio_mem.o
 obj-$(CONFIG_VIRTIO_DMA_SHARED_BUFFER) += virtio_dma_buf.o
 obj-$(CONFIG_VIRTIO_DEBUG) += virtio_debug.o
+obj-$(CONFIG_VIRTIO_RTC) += virtio_rtc.o
+virtio_rtc-y := virtio_rtc_driver.o
diff --git a/drivers/virtio/virtio_rtc_driver.c b/drivers/virtio/virtio_rtc_driver.c
new file mode 100644
index 000000000000..c87ee4e63424
--- /dev/null
+++ b/drivers/virtio/virtio_rtc_driver.c
@@ -0,0 +1,786 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * virtio_rtc driver core
+ *
+ * Copyright (C) 2022-2024 OpenSynergy GmbH
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/completion.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/pm.h>
+#include <linux/virtio.h>
+#include <linux/virtio_config.h>
+#include <linux/virtio_ids.h>
+
+#include <uapi/linux/virtio_rtc.h>
+
+#include "virtio_rtc_internal.h"
+
+/* virtqueue order */
+enum {
+	VIORTC_REQUESTQ,
+	VIORTC_MAX_NR_QUEUES,
+};
+
+/**
+ * struct viortc_vq - virtqueue abstraction
+ * @vq: virtqueue
+ * @lock: protects access to vq
+ */
+struct viortc_vq {
+	struct virtqueue *vq;
+	spinlock_t lock;
+};
+
+/**
+ * struct viortc_dev - virtio_rtc device data
+ * @vdev: virtio device
+ * @vqs: virtqueues
+ * @num_clocks: # of virtio_rtc clocks
+ */
+struct viortc_dev {
+	struct virtio_device *vdev;
+	struct viortc_vq vqs[VIORTC_MAX_NR_QUEUES];
+	u16 num_clocks;
+};
+
+/**
+ * struct viortc_msg - Message requested by driver, responded by device.
+ * @viortc: device data
+ * @req: request buffer
+ * @resp: response buffer
+ * @responded: vqueue callback signals response reception
+ * @refcnt: Message reference count, message and buffers will be deallocated
+ *	    once 0. refcnt is decremented in the vqueue callback and in the
+ *	    thread waiting on the responded completion.
+ *          If a message response wait function times out, the message will be
+ *          freed upon late reception (refcnt will reach 0 in the callback), or
+ *          device removal.
+ * @req_size: size of request in bytes
+ * @resp_cap: maximum size of response in bytes
+ * @resp_actual_size: actual size of response
+ */
+struct viortc_msg {
+	struct viortc_dev *viortc;
+	void *req;
+	void *resp;
+	struct completion responded;
+	refcount_t refcnt;
+	unsigned int req_size;
+	unsigned int resp_cap;
+	unsigned int resp_actual_size;
+};
+
+/**
+ * viortc_msg_init() - Allocate and initialize requestq message.
+ * @viortc: device data
+ * @msg_type: virtio_rtc message type
+ * @req_size: size of request buffer to be allocated
+ * @resp_cap: size of response buffer to be allocated
+ *
+ * Initializes the message refcnt to 2. The refcnt will be decremented once in
+ * the virtqueue callback, and once in the thread waiting on the message (on
+ * completion or timeout).
+ *
+ * Context: Process context.
+ * Return: non-NULL on success.
+ */
+static struct viortc_msg *viortc_msg_init(struct viortc_dev *viortc,
+					  u16 msg_type, unsigned int req_size,
+					  unsigned int resp_cap)
+{
+	struct device *dev = &viortc->vdev->dev;
+	struct virtio_rtc_req_head *req_head;
+	struct viortc_msg *msg;
+
+	msg = devm_kzalloc(dev, sizeof(*msg), GFP_KERNEL);
+	if (!msg)
+		return NULL;
+
+	init_completion(&msg->responded);
+
+	msg->req = devm_kzalloc(dev, req_size, GFP_KERNEL);
+	if (!msg->req)
+		goto err_free_msg;
+
+	req_head = msg->req;
+
+	msg->resp = devm_kzalloc(dev, resp_cap, GFP_KERNEL);
+	if (!msg->resp)
+		goto err_free_msg_req;
+
+	msg->viortc = viortc;
+	msg->req_size = req_size;
+	msg->resp_cap = resp_cap;
+
+	refcount_set(&msg->refcnt, 2);
+
+	req_head->msg_type = virtio_cpu_to_le(msg_type, req_head->msg_type);
+
+	return msg;
+
+err_free_msg_req:
+	devm_kfree(dev, msg->req);
+
+err_free_msg:
+	devm_kfree(dev, msg);
+
+	return NULL;
+}
+
+/**
+ * viortc_msg_release() - Decrement message refcnt, potentially free message.
+ * @msg: message requested by driver
+ *
+ * Context: Any context.
+ */
+static void viortc_msg_release(struct viortc_msg *msg)
+{
+	struct device *dev;
+
+	if (refcount_dec_and_test(&msg->refcnt)) {
+		dev = &msg->viortc->vdev->dev;
+
+		devm_kfree(dev, msg->req);
+		devm_kfree(dev, msg->resp);
+		devm_kfree(dev, msg);
+	}
+}
+
+/**
+ * viortc_do_cb() - generic virtqueue callback logic
+ * @vq: virtqueue
+ * @handle_buf: function to process a used buffer
+ *
+ * Context: virtqueue callback, typically interrupt. Takes and releases vq lock.
+ */
+static void viortc_do_cb(struct virtqueue *vq,
+			 void (*handle_buf)(void *token, unsigned int len,
+					    struct virtqueue *vq,
+					    struct viortc_vq *viortc_vq,
+					    struct viortc_dev *viortc))
+{
+	struct viortc_dev *viortc = vq->vdev->priv;
+	struct viortc_vq *viortc_vq;
+	bool cb_enabled = true;
+	unsigned long flags;
+	unsigned int len;
+	void *token;
+
+	viortc_vq = &viortc->vqs[vq->index];
+
+	for (;;) {
+		spin_lock_irqsave(&viortc_vq->lock, flags);
+
+		if (cb_enabled) {
+			virtqueue_disable_cb(vq);
+			cb_enabled = false;
+		}
+
+		token = virtqueue_get_buf(vq, &len);
+		if (!token) {
+			if (virtqueue_enable_cb(vq)) {
+				spin_unlock_irqrestore(&viortc_vq->lock, flags);
+				return;
+			}
+			cb_enabled = true;
+		}
+
+		spin_unlock_irqrestore(&viortc_vq->lock, flags);
+
+		if (token)
+			handle_buf(token, len, vq, viortc_vq, viortc);
+	}
+}
+
+/**
+ * viortc_requestq_hdlr() - process a requestq used buffer
+ * @token: token identifying the buffer
+ * @len: bytes written by device
+ * @vq: virtqueue
+ * @viortc_vq: device specific data for virtqueue
+ * @viortc: device data
+ *
+ * Signals completion for each received message.
+ *
+ * Context: virtqueue callback
+ */
+static void viortc_requestq_hdlr(void *token, unsigned int len,
+				 struct virtqueue *vq,
+				 struct viortc_vq *viortc_vq,
+				 struct viortc_dev *viortc)
+{
+	struct viortc_msg *msg = token;
+
+	msg->resp_actual_size = len;
+
+	complete(&msg->responded);
+	viortc_msg_release(msg);
+}
+
+/**
+ * viortc_cb_requestq() - callback for requestq
+ * @vq: virtqueue
+ *
+ * Context: virtqueue callback
+ */
+static void viortc_cb_requestq(struct virtqueue *vq)
+{
+	viortc_do_cb(vq, viortc_requestq_hdlr);
+}
+
+/**
+ * viortc_get_resp_errno() - converts virtio_rtc errnos to system errnos
+ * @resp_head: message response header
+ *
+ * Return: negative system errno, or 0
+ */
+static int viortc_get_resp_errno(struct virtio_rtc_resp_head *resp_head)
+{
+	switch (virtio_le_to_cpu(resp_head->status)) {
+	case VIRTIO_RTC_S_OK:
+		return 0;
+	case VIRTIO_RTC_S_EOPNOTSUPP:
+		return -EOPNOTSUPP;
+	case VIRTIO_RTC_S_EINVAL:
+		return -EINVAL;
+	case VIRTIO_RTC_S_ENODEV:
+		return -ENODEV;
+	case VIRTIO_RTC_S_EIO:
+	default:
+		return -EIO;
+	}
+}
+
+/**
+ * viortc_msg_xfer() - send message request, wait until message response
+ * @vq: virtqueue
+ * @msg: message with driver request
+ * @timeout_jiffies: message response timeout, 0 for no timeout
+ *
+ * Context: Process context. Takes and releases vq.lock. May sleep.
+ * Return: Zero on success, negative error code otherwise.
+ */
+static int viortc_msg_xfer(struct viortc_vq *vq, struct viortc_msg *msg,
+			   unsigned long timeout_jiffies)
+{
+	struct scatterlist out_sg[1];
+	struct scatterlist in_sg[1];
+	struct scatterlist *sgs[2];
+	unsigned long flags;
+	long timeout_ret;
+	bool notify;
+	int ret;
+
+	sgs[0] = out_sg;
+	sgs[1] = in_sg;
+
+	sg_init_one(out_sg, msg->req, msg->req_size);
+	sg_init_one(in_sg, msg->resp, msg->resp_cap);
+
+	spin_lock_irqsave(&vq->lock, flags);
+
+	ret = virtqueue_add_sgs(vq->vq, sgs, 1, 1, msg, GFP_ATOMIC);
+	if (ret) {
+		spin_unlock_irqrestore(&vq->lock, flags);
+		/*
+		 * Release in place of the response callback, which will never
+		 * come.
+		 */
+		viortc_msg_release(msg);
+		return ret;
+	}
+
+	notify = virtqueue_kick_prepare(vq->vq);
+
+	spin_unlock_irqrestore(&vq->lock, flags);
+
+	if (notify)
+		virtqueue_notify(vq->vq);
+
+	if (timeout_jiffies) {
+		timeout_ret = wait_for_completion_interruptible_timeout(
+			&msg->responded, timeout_jiffies);
+
+		if (!timeout_ret)
+			return -ETIMEDOUT;
+		else if (timeout_ret < 0)
+			return (int)timeout_ret;
+	} else {
+		ret = wait_for_completion_interruptible(&msg->responded);
+		if (ret)
+			return ret;
+	}
+
+	if (msg->resp_actual_size < sizeof(struct virtio_rtc_resp_head))
+		return -EINVAL;
+
+	ret = viortc_get_resp_errno(msg->resp);
+	if (ret)
+		return ret;
+
+	/*
+	 * There is not yet a case where returning a short message would make
+	 * sense, so consider any deviation an error.
+	 */
+	if (msg->resp_actual_size != msg->resp_cap)
+		return -EINVAL;
+
+	return 0;
+}
+
+/*
+ * common message handle macros for messages of different types
+ */
+
+/**
+ * VIORTC_DECLARE_MSG_HDL_ONSTACK() - declare message handle on stack
+ * @hdl: message handle name
+ * @msg_id: message type id
+ * @msg_req: message request type
+ * @msg_resp: message response type
+ */
+#define VIORTC_DECLARE_MSG_HDL_ONSTACK(hdl, msg_id, msg_req, msg_resp)         \
+	struct {                                                               \
+		struct viortc_msg *msg;                                        \
+		msg_req *req;                                                  \
+		msg_resp *resp;                                                \
+		unsigned int req_size;                                         \
+		unsigned int resp_cap;                                         \
+		u16 msg_type;                                                  \
+	} hdl = {                                                              \
+		NULL, NULL, NULL, sizeof(msg_req), sizeof(msg_resp), (msg_id), \
+	}
+
+/**
+ * VIORTC_MSG() - extract message from message handle
+ * @hdl: message handle
+ *
+ * Return: struct viortc_msg
+ */
+#define VIORTC_MSG(hdl) ((hdl).msg)
+
+/**
+ * VIORTC_MSG_INIT() - initialize message handle
+ * @hdl: message handle
+ * @viortc: device data (struct viortc_dev *)
+ *
+ * Context: Process context.
+ * Return: 0 on success, -ENOMEM otherwise.
+ */
+#define VIORTC_MSG_INIT(hdl, viortc)                                         \
+	({                                                                   \
+		typeof(hdl) *_hdl = &(hdl);                                  \
+									     \
+		_hdl->msg = viortc_msg_init((viortc), _hdl->msg_type,        \
+					    _hdl->req_size, _hdl->resp_cap); \
+		if (_hdl->msg) {                                             \
+			_hdl->req = _hdl->msg->req;                          \
+			_hdl->resp = _hdl->msg->resp;                        \
+		}                                                            \
+		_hdl->msg ? 0 : -ENOMEM;                                     \
+	})
+
+/**
+ * VIORTC_MSG_WRITE() - write a request message field
+ * @hdl: message handle
+ * @dest_member: request message field name
+ * @src_ptr: pointer to data of compatible type
+ *
+ * Writes the field in little-endian format.
+ */
+#define VIORTC_MSG_WRITE(hdl, dest_member, src_ptr)                         \
+	do {                                                                \
+		typeof(hdl) _hdl = (hdl);                                   \
+		typeof(src_ptr) _src_ptr = (src_ptr);                       \
+									    \
+		/* Sanity check: must match the member's type */            \
+		typecheck(typeof(virtio_le_to_cpu(_hdl.req->dest_member)),  \
+			  *_src_ptr);                                       \
+									    \
+		_hdl.req->dest_member =                                     \
+			virtio_cpu_to_le(*_src_ptr, _hdl.req->dest_member); \
+	} while (0)
+
+/**
+ * VIORTC_MSG_READ() - read from a response message field
+ * @hdl: message handle
+ * @src_member: response message field name
+ * @dest_ptr: pointer to data of compatible type
+ *
+ * Converts from little-endian format and writes to dest_ptr.
+ */
+#define VIORTC_MSG_READ(hdl, src_member, dest_ptr)                          \
+	do {                                                                \
+		typeof(dest_ptr) _dest_ptr = (dest_ptr);                    \
+									    \
+		/* Sanity check: must match the member's type */            \
+		typecheck(typeof(virtio_le_to_cpu((hdl).resp->src_member)), \
+			  *_dest_ptr);                                      \
+									    \
+		*_dest_ptr = virtio_le_to_cpu((hdl).resp->src_member);      \
+	} while (0)
+
+/*
+ * read requests
+ */
+
+/** timeout for clock readings, where timeouts are considered non-fatal */
+#define VIORTC_MSG_READ_TIMEOUT secs_to_jiffies(60)
+
+/**
+ * viortc_read() - VIRTIO_RTC_REQ_READ wrapper
+ * @viortc: device data
+ * @vio_clk_id: virtio_rtc clock id
+ * @reading: clock reading [ns]
+ *
+ * Context: Process context.
+ * Return: Zero on success, negative error code otherwise.
+ */
+int viortc_read(struct viortc_dev *viortc, u16 vio_clk_id, u64 *reading)
+{
+	VIORTC_DECLARE_MSG_HDL_ONSTACK(hdl, VIRTIO_RTC_REQ_READ,
+				       struct virtio_rtc_req_read,
+				       struct virtio_rtc_resp_read);
+	int ret;
+
+	ret = VIORTC_MSG_INIT(hdl, viortc);
+	if (ret)
+		return ret;
+
+	VIORTC_MSG_WRITE(hdl, clock_id, &vio_clk_id);
+
+	ret = viortc_msg_xfer(&viortc->vqs[VIORTC_REQUESTQ], VIORTC_MSG(hdl),
+			      VIORTC_MSG_READ_TIMEOUT);
+	if (ret) {
+		dev_dbg(&viortc->vdev->dev, "%s: xfer returned %d\n", __func__,
+			ret);
+		goto out_release;
+	}
+
+	VIORTC_MSG_READ(hdl, clock_reading, reading);
+
+out_release:
+	viortc_msg_release(VIORTC_MSG(hdl));
+
+	return ret;
+}
+
+/**
+ * viortc_read_cross() - VIRTIO_RTC_REQ_READ_CROSS wrapper
+ * @viortc: device data
+ * @vio_clk_id: virtio_rtc clock id
+ * @hw_counter: virtio_rtc HW counter type
+ * @reading: clock reading [ns]
+ * @cycles: HW counter cycles during clock reading
+ *
+ * Context: Process context.
+ * Return: Zero on success, negative error code otherwise.
+ */
+int viortc_read_cross(struct viortc_dev *viortc, u16 vio_clk_id, u8 hw_counter,
+		      u64 *reading, u64 *cycles)
+{
+	VIORTC_DECLARE_MSG_HDL_ONSTACK(hdl, VIRTIO_RTC_REQ_READ_CROSS,
+				       struct virtio_rtc_req_read_cross,
+				       struct virtio_rtc_resp_read_cross);
+	int ret;
+
+	ret = VIORTC_MSG_INIT(hdl, viortc);
+	if (ret)
+		return ret;
+
+	VIORTC_MSG_WRITE(hdl, clock_id, &vio_clk_id);
+	VIORTC_MSG_WRITE(hdl, hw_counter, &hw_counter);
+
+	ret = viortc_msg_xfer(&viortc->vqs[VIORTC_REQUESTQ], VIORTC_MSG(hdl),
+			      VIORTC_MSG_READ_TIMEOUT);
+	if (ret) {
+		dev_dbg(&viortc->vdev->dev, "%s: xfer returned %d\n", __func__,
+			ret);
+		goto out_release;
+	}
+
+	VIORTC_MSG_READ(hdl, clock_reading, reading);
+	VIORTC_MSG_READ(hdl, counter_cycles, cycles);
+
+out_release:
+	viortc_msg_release(VIORTC_MSG(hdl));
+
+	return ret;
+}
+
+/*
+ * control requests
+ */
+
+/**
+ * viortc_cfg() - VIRTIO_RTC_REQ_CFG wrapper
+ * @viortc: device data
+ * @num_clocks: # of virtio_rtc clocks
+ *
+ * Context: Process context.
+ * Return: Zero on success, negative error code otherwise.
+ */
+static int viortc_cfg(struct viortc_dev *viortc, u16 *num_clocks)
+{
+	VIORTC_DECLARE_MSG_HDL_ONSTACK(hdl, VIRTIO_RTC_REQ_CFG,
+				       struct virtio_rtc_req_cfg,
+				       struct virtio_rtc_resp_cfg);
+	int ret;
+
+	ret = VIORTC_MSG_INIT(hdl, viortc);
+	if (ret)
+		return ret;
+
+	ret = viortc_msg_xfer(&viortc->vqs[VIORTC_REQUESTQ], VIORTC_MSG(hdl),
+			      0);
+	if (ret) {
+		dev_dbg(&viortc->vdev->dev, "%s: xfer returned %d\n", __func__,
+			ret);
+		goto out_release;
+	}
+
+	VIORTC_MSG_READ(hdl, num_clocks, num_clocks);
+
+out_release:
+	viortc_msg_release(VIORTC_MSG(hdl));
+
+	return ret;
+}
+
+/**
+ * viortc_clock_cap() - VIRTIO_RTC_REQ_CLOCK_CAP wrapper
+ * @viortc: device data
+ * @vio_clk_id: virtio_rtc clock id
+ * @type: virtio_rtc clock type
+ * @leap_second_smearing: virtio_rtc smearing variant
+ *
+ * Context: Process context.
+ * Return: Zero on success, negative error code otherwise.
+ */
+static int viortc_clock_cap(struct viortc_dev *viortc, u16 vio_clk_id, u8 *type,
+			    u8 *leap_second_smearing)
+{
+	VIORTC_DECLARE_MSG_HDL_ONSTACK(hdl, VIRTIO_RTC_REQ_CLOCK_CAP,
+				       struct virtio_rtc_req_clock_cap,
+				       struct virtio_rtc_resp_clock_cap);
+	int ret;
+
+	ret = VIORTC_MSG_INIT(hdl, viortc);
+	if (ret)
+		return ret;
+
+	VIORTC_MSG_WRITE(hdl, clock_id, &vio_clk_id);
+
+	ret = viortc_msg_xfer(&viortc->vqs[VIORTC_REQUESTQ], VIORTC_MSG(hdl),
+			      0);
+	if (ret) {
+		dev_dbg(&viortc->vdev->dev, "%s: xfer returned %d\n", __func__,
+			ret);
+		goto out_release;
+	}
+
+	VIORTC_MSG_READ(hdl, type, type);
+	VIORTC_MSG_READ(hdl, leap_second_smearing, leap_second_smearing);
+
+out_release:
+	viortc_msg_release(VIORTC_MSG(hdl));
+
+	return ret;
+}
+
+/**
+ * viortc_cross_cap() - VIRTIO_RTC_REQ_CROSS_CAP wrapper
+ * @viortc: device data
+ * @vio_clk_id: virtio_rtc clock id
+ * @hw_counter: virtio_rtc HW counter type
+ * @supported: xtstamping is supported for the vio_clk_id/hw_counter pair
+ *
+ * Context: Process context.
+ * Return: Zero on success, negative error code otherwise.
+ */
+int viortc_cross_cap(struct viortc_dev *viortc, u16 vio_clk_id, u8 hw_counter,
+		     bool *supported)
+{
+	VIORTC_DECLARE_MSG_HDL_ONSTACK(hdl, VIRTIO_RTC_REQ_CROSS_CAP,
+				       struct virtio_rtc_req_cross_cap,
+				       struct virtio_rtc_resp_cross_cap);
+	u8 flags;
+	int ret;
+
+	ret = VIORTC_MSG_INIT(hdl, viortc);
+	if (ret)
+		return ret;
+
+	VIORTC_MSG_WRITE(hdl, clock_id, &vio_clk_id);
+	VIORTC_MSG_WRITE(hdl, hw_counter, &hw_counter);
+
+	ret = viortc_msg_xfer(&viortc->vqs[VIORTC_REQUESTQ], VIORTC_MSG(hdl),
+			      0);
+	if (ret) {
+		dev_dbg(&viortc->vdev->dev, "%s: xfer returned %d\n", __func__,
+			ret);
+		goto out_release;
+	}
+
+	VIORTC_MSG_READ(hdl, flags, &flags);
+	*supported = !!(flags & VIRTIO_RTC_FLAG_CROSS_CAP);
+
+out_release:
+	viortc_msg_release(VIORTC_MSG(hdl));
+
+	return ret;
+}
+
+/*
+ * init, deinit
+ */
+
+/**
+ * viortc_clocks_init() - init local representations of virtio_rtc clocks
+ * @viortc: device data
+ *
+ * Context: Process context.
+ * Return: Zero on success, negative error code otherwise.
+ */
+static int viortc_clocks_init(struct viortc_dev *viortc)
+{
+	u16 num_clocks;
+	int ret;
+
+	ret = viortc_cfg(viortc, &num_clocks);
+	if (ret)
+		return ret;
+
+	if (num_clocks < 1) {
+		dev_err(&viortc->vdev->dev, "device reported 0 clocks\n");
+		return -ENODEV;
+	}
+
+	viortc->num_clocks = num_clocks;
+
+	/* In the future, PTP clocks will be initialized here. */
+	(void)viortc_clock_cap;
+
+	return ret;
+}
+
+/**
+ * viortc_init_vqs() - init virtqueues
+ * @viortc: device data
+ *
+ * Inits virtqueues and associated data.
+ *
+ * Context: Process context.
+ * Return: Zero on success, negative error code otherwise.
+ */
+static int viortc_init_vqs(struct viortc_dev *viortc)
+{
+	struct virtqueue *vqs[VIORTC_MAX_NR_QUEUES];
+	struct virtqueue_info vqs_info[] = {
+		{ "requestq", viortc_cb_requestq },
+	};
+	struct virtio_device *vdev = viortc->vdev;
+	int nr_queues, ret;
+
+	nr_queues = VIORTC_REQUESTQ + 1;
+
+	ret = virtio_find_vqs(vdev, nr_queues, vqs, vqs_info, NULL);
+	if (ret)
+		return ret;
+
+	viortc->vqs[VIORTC_REQUESTQ].vq = vqs[VIORTC_REQUESTQ];
+	spin_lock_init(&viortc->vqs[VIORTC_REQUESTQ].lock);
+
+	return 0;
+}
+
+/**
+ * viortc_probe() - probe a virtio_rtc virtio device
+ * @vdev: virtio device
+ *
+ * Context: Process context.
+ * Return: Zero on success, negative error code otherwise.
+ */
+static int viortc_probe(struct virtio_device *vdev)
+{
+	struct viortc_dev *viortc;
+	int ret;
+
+	viortc = devm_kzalloc(&vdev->dev, sizeof(*viortc), GFP_KERNEL);
+	if (!viortc)
+		return -ENOMEM;
+
+	vdev->priv = viortc;
+	viortc->vdev = vdev;
+
+	ret = viortc_init_vqs(viortc);
+	if (ret)
+		return ret;
+
+	virtio_device_ready(vdev);
+
+	ret = viortc_clocks_init(viortc);
+	if (ret)
+		goto err_reset_vdev;
+
+	return 0;
+
+err_reset_vdev:
+	virtio_reset_device(vdev);
+	vdev->config->del_vqs(vdev);
+
+	return ret;
+}
+
+/**
+ * viortc_remove() - remove a virtio_rtc virtio device
+ * @vdev: virtio device
+ */
+static void viortc_remove(struct virtio_device *vdev)
+{
+	/* In the future, PTP clocks will be deinitialized here. */
+
+	virtio_reset_device(vdev);
+	vdev->config->del_vqs(vdev);
+}
+
+static int viortc_freeze(struct virtio_device *dev)
+{
+	/*
+	 * Do not reset the device, so that the device may still wake up the
+	 * system through an alarmq notification.
+	 */
+
+	return 0;
+}
+
+static int viortc_restore(struct virtio_device *dev)
+{
+	struct viortc_dev *viortc = dev->priv;
+
+	return viortc_init_vqs(viortc);
+}
+
+static struct virtio_device_id id_table[] = {
+	{ VIRTIO_ID_CLOCK, VIRTIO_DEV_ANY_ID },
+	{ 0 },
+};
+MODULE_DEVICE_TABLE(virtio, id_table);
+
+static struct virtio_driver virtio_rtc_drv = {
+	.driver.name = KBUILD_MODNAME,
+	.id_table = id_table,
+	.probe = viortc_probe,
+	.remove = viortc_remove,
+	.freeze = pm_sleep_ptr(viortc_freeze),
+	.restore = pm_sleep_ptr(viortc_restore),
+};
+
+module_virtio_driver(virtio_rtc_drv);
+
+MODULE_DESCRIPTION("Virtio RTC driver");
+MODULE_AUTHOR("Qualcomm Innovation Center, Inc.");
+MODULE_LICENSE("GPL");
diff --git a/drivers/virtio/virtio_rtc_internal.h b/drivers/virtio/virtio_rtc_internal.h
new file mode 100644
index 000000000000..9c249c15b68f
--- /dev/null
+++ b/drivers/virtio/virtio_rtc_internal.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * virtio_rtc internal interfaces
+ *
+ * Copyright (C) 2022-2023 OpenSynergy GmbH
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _VIRTIO_RTC_INTERNAL_H_
+#define _VIRTIO_RTC_INTERNAL_H_
+
+#include <linux/types.h>
+
+/* driver core IFs */
+
+struct viortc_dev;
+
+int viortc_read(struct viortc_dev *viortc, u16 vio_clk_id, u64 *reading);
+int viortc_read_cross(struct viortc_dev *viortc, u16 vio_clk_id, u8 hw_counter,
+		      u64 *reading, u64 *cycles);
+int viortc_cross_cap(struct viortc_dev *viortc, u16 vio_clk_id, u8 hw_counter,
+		     bool *supported);
+
+#endif /* _VIRTIO_RTC_INTERNAL_H_ */
diff --git a/include/uapi/linux/virtio_rtc.h b/include/uapi/linux/virtio_rtc.h
new file mode 100644
index 000000000000..6b3af4e9bbfb
--- /dev/null
+++ b/include/uapi/linux/virtio_rtc.h
@@ -0,0 +1,151 @@
+/* SPDX-License-Identifier: ((GPL-2.0+ WITH Linux-syscall-note) OR BSD-3-Clause) */
+/*
+ * Copyright (C) 2022-2024 OpenSynergy GmbH
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _LINUX_VIRTIO_RTC_H
+#define _LINUX_VIRTIO_RTC_H
+
+#include <linux/types.h>
+
+/* read request message types */
+
+#define VIRTIO_RTC_REQ_READ			0x0001
+#define VIRTIO_RTC_REQ_READ_CROSS		0x0002
+
+/* control request message types */
+
+#define VIRTIO_RTC_REQ_CFG			0x1000
+#define VIRTIO_RTC_REQ_CLOCK_CAP		0x1001
+#define VIRTIO_RTC_REQ_CROSS_CAP		0x1002
+
+/* Message headers */
+
+/** common request header */
+struct virtio_rtc_req_head {
+	__le16 msg_type;
+	__u8 reserved[6];
+};
+
+/** common response header */
+struct virtio_rtc_resp_head {
+#define VIRTIO_RTC_S_OK			0
+#define VIRTIO_RTC_S_EOPNOTSUPP		2
+#define VIRTIO_RTC_S_ENODEV		3
+#define VIRTIO_RTC_S_EINVAL		4
+#define VIRTIO_RTC_S_EIO		5
+	__u8 status;
+	__u8 reserved[7];
+};
+
+/* read requests */
+
+/* VIRTIO_RTC_REQ_READ message */
+
+struct virtio_rtc_req_read {
+	struct virtio_rtc_req_head head;
+	__le16 clock_id;
+	__u8 reserved[6];
+};
+
+struct virtio_rtc_resp_read {
+	struct virtio_rtc_resp_head head;
+	__le64 clock_reading;
+};
+
+/* VIRTIO_RTC_REQ_READ_CROSS message */
+
+struct virtio_rtc_req_read_cross {
+	struct virtio_rtc_req_head head;
+	__le16 clock_id;
+/* Arm Generic Timer Counter-timer Virtual Count Register (CNTVCT_EL0) */
+#define VIRTIO_RTC_COUNTER_ARM_VCT	0
+/* x86 Time-Stamp Counter */
+#define VIRTIO_RTC_COUNTER_X86_TSC	1
+/* Invalid */
+#define VIRTIO_RTC_COUNTER_INVALID	0xFF
+	__u8 hw_counter;
+	__u8 reserved[5];
+};
+
+struct virtio_rtc_resp_read_cross {
+	struct virtio_rtc_resp_head head;
+	__le64 clock_reading;
+	__le64 counter_cycles;
+};
+
+/* control requests */
+
+/* VIRTIO_RTC_REQ_CFG message */
+
+struct virtio_rtc_req_cfg {
+	struct virtio_rtc_req_head head;
+	/* no request params */
+};
+
+struct virtio_rtc_resp_cfg {
+	struct virtio_rtc_resp_head head;
+	/** # of clocks -> clock ids < num_clocks are valid */
+	__le16 num_clocks;
+	__u8 reserved[6];
+};
+
+/* VIRTIO_RTC_REQ_CLOCK_CAP message */
+
+struct virtio_rtc_req_clock_cap {
+	struct virtio_rtc_req_head head;
+	__le16 clock_id;
+	__u8 reserved[6];
+};
+
+struct virtio_rtc_resp_clock_cap {
+	struct virtio_rtc_resp_head head;
+#define VIRTIO_RTC_CLOCK_UTC			0
+#define VIRTIO_RTC_CLOCK_TAI			1
+#define VIRTIO_RTC_CLOCK_MONOTONIC		2
+#define VIRTIO_RTC_CLOCK_UTC_SMEARED		3
+#define VIRTIO_RTC_CLOCK_UTC_MAYBE_SMEARED	4
+	__u8 type;
+#define VIRTIO_RTC_SMEAR_UNSPECIFIED	0
+#define VIRTIO_RTC_SMEAR_NOON_LINEAR	1
+#define VIRTIO_RTC_SMEAR_UTC_SLS	2
+	__u8 leap_second_smearing;
+	__u8 reserved[6];
+};
+
+/* VIRTIO_RTC_REQ_CROSS_CAP message */
+
+struct virtio_rtc_req_cross_cap {
+	struct virtio_rtc_req_head head;
+	__le16 clock_id;
+	__u8 hw_counter;
+	__u8 reserved[5];
+};
+
+struct virtio_rtc_resp_cross_cap {
+	struct virtio_rtc_resp_head head;
+#define VIRTIO_RTC_FLAG_CROSS_CAP	(1 << 0)
+	__u8 flags;
+	__u8 reserved[7];
+};
+
+/** Union of request types for requestq */
+union virtio_rtc_req_requestq {
+	struct virtio_rtc_req_read read;
+	struct virtio_rtc_req_read_cross read_cross;
+	struct virtio_rtc_req_cfg cfg;
+	struct virtio_rtc_req_clock_cap clock_cap;
+	struct virtio_rtc_req_cross_cap cross_cap;
+};
+
+/** Union of response types for requestq */
+union virtio_rtc_resp_requestq {
+	struct virtio_rtc_resp_read read;
+	struct virtio_rtc_resp_read_cross read_cross;
+	struct virtio_rtc_resp_cfg cfg;
+	struct virtio_rtc_resp_clock_cap clock_cap;
+	struct virtio_rtc_resp_cross_cap cross_cap;
+};
+
+#endif /* _LINUX_VIRTIO_RTC_H */
-- 
2.43.0


